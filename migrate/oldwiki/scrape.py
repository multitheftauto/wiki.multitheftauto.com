import requests
from bs4 import BeautifulSoup
from html_to_markdown import convert_to_markdown
import yaml

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
                    page_url = a.get("href")
                    page_url = f"https://wiki.multitheftauto.com{page_url}"
                    if name not in result[current_category]:
                        result[current_category].append((page_url, name))

    return result


def str_presenter(dumper, data):
    """Force block style for multiline strings"""
    if '\n' in data:  # Only use block style for multiline strings
        return dumper.represent_scalar('tag:yaml.org,2002:str', data, style='|')
    return dumper.represent_scalar('tag:yaml.org,2002:str', data)

# Register the custom string presenter
yaml.add_representer(str, str_presenter)

def convert_page_to_yaml(page_url: str, name: str, source: str) -> str:
    # This scrapes the page and tries to parse the MediaWiki content into a YAML format for the function/event
    
    is_function = "function" in source.lower()
    is_event = "event" in source.lower()
    if not (is_function or is_event):
        raise ValueError("Source must be either a function or an event.")
    
    if is_event:
        response = requests.get(page_url)
        soup = BeautifulSoup(response.text, "html.parser")

        # Find first non-empty p inside mw-content-text
        content_div = soup.find("div", id="mw-content-text")
        if not content_div:
            raise ValueError(f"Could not find content in {page_url}.")
        
        paragraphs = content_div.find_all("p")
        event_description = None
        for p in paragraphs:
            text = p.get_text()
            if text and not text.isspace():
                event_description = convert_to_markdown(str(p))
                break
        if not event_description:
            raise ValueError(f"Could not find a valid description for {name}.")
        
        yaml_dict = {
            "incomplete": True,
            "name": name,
            "type": "client" if "Client" in source else "server",
            "source_element": {
                "type": "element",
                "description": "TODO"
            },
            "description": event_description.strip()
        }
        yaml_content = yaml.safe_dump(yaml_dict,
                                        sort_keys=False,
                                        allow_unicode=True,
                                        default_flow_style=False)

    elif is_function:
        if source.startswith("Shared"):
            yaml_content = "shared: &shared\n"
            yaml_content += f"  name: {name}\n"
            yaml_content += f"  description: TODO\n"
            yaml_content += f"  incomplete: true\n"
            yaml_content += "\nserver:\n  <<: *shared"
            yaml_content += "\nclient:\n  <<: *shared"
        elif source.startswith("Server"):
            yaml_content = "server:\n"
            yaml_content += f"  name: {name}\n"
            yaml_content += f"  description: TODO\n"
            yaml_content += f"  incomplete: true\n"
        elif source.startswith("Client"):
            yaml_content = "client:\n"
            yaml_content += f"  name: {name}\n"
            yaml_content += f"  description: TODO\n"
            yaml_content += f"  incomplete: true\n"

    return yaml_content

def write_yaml_per_entry(base_dir, data_by_source):
    for source, categories in data_by_source.items():
        print(f"Writing YAML files for {source}...")
        for category, entries in categories.items():
            dir_path = os.path.join(base_dir, category)
            os.makedirs(dir_path, exist_ok=True)

            for entry in entries:
                page_url, name = entry
                filename = os.path.join(dir_path, f"{name}.yaml")
                file_content = f"# Scraped from: {page_url}\n"
                try:
                    with open(filename, "w", encoding="utf-8") as f:
                        file_content += convert_page_to_yaml(page_url, name, source)
                        f.write(file_content)
                except Exception as e:
                    print(f"Error processing {name} from {page_url}: {e}")
                    # Cancel and continue to next entry, closing/deleting file if needed
                    if os.path.exists(filename):
                        os.remove(filename)
                    
        print(f"YAML files for {source} written successfully to {base_dir}.")

def main():
    functions_by_source = {}
    events_by_source = {}

    # Functions
    # functions_by_source["Client functions"] = parse_links("Client functions", URL_CLIENT_FUNCS)
    # functions_by_source["Server functions"] = parse_links("Server functions", URL_SERVER_FUNCS)
    # functions_by_source["Shared functions"] = parse_links("Shared functions", URL_SHARED_FUNCS)

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
