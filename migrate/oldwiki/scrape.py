import requests
from bs4 import BeautifulSoup
import os
import shutil

# 🌐 URL constants
URL_CLIENT_FUNCS = "https://wiki.multitheftauto.com/wiki/Client_Scripting_Functions"
URL_SERVER_FUNCS = "https://wiki.multitheftauto.com/wiki/Server_Scripting_Functions"
URL_SHARED_FUNCS = "https://wiki.multitheftauto.com/wiki/Shared_Scripting_Functions"

URL_CLIENT_EVENTS = "https://wiki.multitheftauto.com/wiki/Client_Scripting_Events"
URL_SERVER_EVENTS = "https://wiki.multitheftauto.com/wiki/Server_Scripting_Events"

FUNCTIONS_DIR = "./output/functions"
EVENTS_DIR = "./output/events"

CATEGORY_CORRECTIONS = {
    'SQL': 'Database',
    'Collision_shape': 'Colshape',
    'Weapon_creation': 'Weapon',
}

def clean_category(category_name: str) -> str:
    if category_name.endswith("events"):
        return category_name[:-7]
    elif category_name.endswith("functions"):
        return category_name[:-10]
    return category_name

def fix_category(category_name: str) -> str:
    category_name = category_name.replace(" ", "_")
    if category_name in CATEGORY_CORRECTIONS:
        return CATEGORY_CORRECTIONS[category_name]
    return category_name

def parse_links(source_label: str, url: str) -> dict:
    print(f"Parsing {source_label} from {url}...")

    response = requests.get(url)
    soup = BeautifulSoup(response.text, "html.parser")

    content_div = soup.find("div", id="mw-content-text")
    if not content_div:
        raise ValueError(f"Could not find content in {source_label}.")

    result = {}
    current_category = None

    for element in content_div.find_all(["h2", "h3", "ul"]):
        if element.name == "h2":
            span = element.find("span", class_="mw-headline")
            if span:
                current_category = clean_category(span.text.strip())
                current_category = fix_category(current_category)
                result[current_category] = []
        elif element.name == "ul" and current_category:
            for li in element.find_all("li"):
                a = li.find("a")
                if a and a.get("href", "").startswith("/wiki/"):
                    name = a.text.strip()
                    name = name.replace("/wiki/", "").split("/")[-1]
                    if name not in result[current_category]:
                        result[current_category].append(name)

    return result

def write_yaml_per_entry(base_dir, data_by_source):
    for source, categories in data_by_source.items():
        for category, entries in categories.items():
            dir_path = os.path.join(base_dir, category)
            os.makedirs(dir_path, exist_ok=True)

            for entry in entries:
                filename = os.path.join(dir_path, f"{entry}.yaml")
                with open(filename, "w", encoding="utf-8") as f:
                    if source.startswith("Client events") or source.startswith("Server events"):
                        file_content = f"# Scraped from: https://wiki.multitheftauto.com/wiki/{entry}\n"
                        file_content += f"name: {entry}\n"
                        file_content += f"type: {'client' if source.startswith('Client') else 'server'}\n"
                        file_content += "description: THIS EVENT NEEDS DOCUMENTATION\n"
                        file_content += "source_element:\n"
                        file_content += "  type: element\n"
                        file_content += "  description: TODO\n"
                        f.write(file_content)
                    elif source.startswith("Client functions") or source.startswith("Server functions") or source.startswith("Shared functions"):
                        file_content = f"# Scraped from: https://wiki.multitheftauto.com/wiki/{entry}\n"
                        if source.startswith("Shared"):
                            file_content += "shared: &shared\n"
                            file_content += f"  name: {entry}\n"
                            file_content += f"  description: THIS FUNCTION NEEDS DOCUMENTATION\n"
                            file_content += "\nserver:\n  <<: *shared"
                            file_content += "\nclient:\n  <<: *shared"
                        elif source.startswith("Server"):
                            file_content += "server:\n"
                            file_content += f"  name: {entry}\n"
                            file_content += f"  description: THIS FUNCTION NEEDS DOCUMENTATION\n"
                        elif source.startswith("Client"):
                            file_content += "client:\n"
                            file_content += f"  name: {entry}\n"
                            file_content += f"  description: THIS FUNCTION NEEDS DOCUMENTATION\n"
                        
                        f.write(file_content)
    
    print(f"YAML files written to {base_dir}.")

def main():
    functions_by_source = {}
    events_by_source = {}

    # Functions
    functions_by_source["Client functions"] = parse_links("Client functions", URL_CLIENT_FUNCS)
    functions_by_source["Server functions"] = parse_links("Server functions", URL_SERVER_FUNCS)
    functions_by_source["Shared functions"] = parse_links("Shared functions", URL_SHARED_FUNCS)

    # Events
    events_by_source["Client events"] = parse_links("Client events", URL_CLIENT_EVENTS)
    events_by_source["Server events"] = parse_links("Server events", URL_SERVER_EVENTS)

    # Empty output directory
    if os.path.exists("./output"):
        shutil.rmtree("./output")

    write_yaml_per_entry(FUNCTIONS_DIR, functions_by_source)
    write_yaml_per_entry(EVENTS_DIR, events_by_source)

if __name__ == "__main__":
    main()
