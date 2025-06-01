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

NAME_BLACKLIST = [
    'Matrix',
    'Vector'
]

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
    print(f"Parsing list of {source_label} from {url}...")

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
                    if any(blacklist in name for blacklist in NAME_BLACKLIST):
                        continue
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

def parse_examples(content_div):
    
    examples = []
    example_header = content_div.find("span", id=lambda x: x and x.lower() in ["example", "examples"])

    if example_header:
        current = example_header.find_parent(["h2", "h3"]).find_next_sibling()
        while current:
            # Stop at the next section
            if current.name in ["h2", "h3"]:
                break

            # Case 1: Structured example (wrapped in section divs)
            if current.name == "div" and current.get("id", "").startswith("section"):
                section_type = None
                prev_sibling = current.find_previous_sibling()
                if prev_sibling:
                    if "serverHeader" in prev_sibling.get("class", []):
                        section_type = "server"
                    elif "clientHeader" in prev_sibling.get("class", []):
                        section_type = "client"

                desc = current.find("p")
                code = current.find("pre")

                if code:
                    examples.append({
                        "type": section_type,
                        "description": desc.get_text(strip=True) if desc else "",
                        "code": code.get_text(strip=True)
                    })

            # Case 2: <p> followed by <pre> (loose example)
            elif current.name == "p":
                next_sibling = current.find_next_sibling()
                if next_sibling and next_sibling.name == "pre":
                    examples.append({
                        "type": None,
                        "description": current.get_text(strip=True),
                        "code": next_sibling.get_text(strip=True)
                    })
                    current = next_sibling  # skip next since it's handled

            # Case 3: Just a <pre> after the header (no <p>, no section)
            elif current.name == "pre":
                examples.append({
                    "type": None,
                    "description": "",  # no description available
                    "code": current.get_text(strip=True)
                })

            current = current.find_next_sibling()

    return examples


def parse_notes(content_div):
    note_boxes = []

    # 1. Note and warning boxes use specific class names
    for box in content_div.select(".note-messagebox, .warning-messagebox"):
        box_classes = box.get("class", [])
        box_type = "note" if "note-messagebox" in box_classes else "warning"
        
        table = box.find("table")
        if not table:
            continue

        rows = table.find_all("tr")
        if not rows:
            continue

        # Get the second <td> of the first <tr>
        cells = rows[0].find_all("td")
        if len(cells) >= 2:
            message_cell = cells[1]
            text = message_cell.get_text(" ", strip=True)

            # Remove prefix like "Note:" or "Warning:"
            prefix = "Note:" if box_type == "note" else "Warning:"
            if text.startswith(prefix):
                text = text[len(prefix):].strip()

            note_boxes.append({
                "type": box_type,
                "text": text
            })


    # 2. Tip boxes don't have a class, so we identify them by their style (border color)
    for table in content_div.find_all("table"):
        style = table.get("style", "")
        if "98fb98" in style and "border-left" in style:  # distinctive green border

            rows = table.find_all("tr")
            if not rows:
                continue
            # Get the second <td> of the first <tr>
            cells = rows[0].find_all("td")
            if len(cells) >= 2:
                message_cell = cells[1]
                text = message_cell.get_text(" ", strip=True)
                text = text.replace("Tip:", "", 1).strip()
                note_boxes.append({
                    "type": "tip",
                    "text": text
                })

    # 3. Important Note boxes also don't have class, FFB2B2 border color
    for table in content_div.find_all("table"):
        # Ignore if it parent div has class "warning-messagebox" (because that's also the same color lol)
        if "warning-messagebox" in table.parent.get("class", []):
            continue
        style = table.get("style", "")
        if "FFB2B2" in style and "border-left" in style:

            rows = table.find_all("tr")
            if not rows:
                continue
            # Get the second <td> of the first <tr>
            cells = rows[0].find_all("td")
            if len(cells) >= 2:
                message_cell = cells[1]
                text = message_cell.get_text(" ", strip=True)
                text = text.replace("Important Note:", "", 1).strip()
                note_boxes.append({
                    "type": "important",
                    "text": text
                })
    
    # 4. "This article needs checking" boxes (purple border, distinct title)
    for table in content_div.find_all("table"):
        style = table.get("style", "")
        if "border-left: 25px solid #8181ff" in style:
            rows = table.find_all("tr")
            if len(rows) >= 2:
                # First row: check for title
                cells_first_row = rows[0].find_all("td")
                if len(cells_first_row) >= 2:
                    title = cells_first_row[1].get_text(strip=True)
                    if "This article needs checking." in title:
                        # Second row: reason
                        reason_cell = rows[1].find("td")
                        if reason_cell:
                            text = reason_cell.get_text(" ", strip=True)
                            text = text.replace("Reason(s):", "", 1).strip()
                            note_boxes.append({
                                "type": "needs_checking",
                                "text": text
                            })

    the_notes = []
    the_meta = []
    for note in note_boxes:
        if note["type"] == "note" or note["type"] == "tip" or note["type"] == "warning" or note["type"] == "important":
            the_notes.append({
                "type": "info" if note["type"] == "note" else note["type"],
                "content": note["text"]
            })
        elif note["type"] == "needs_checking":
            the_meta.append({
                "needs_checking": note["text"]
            })

    return the_notes, the_meta

def parse_description(content_div):
    
    the_description = None
    # Find the first p before a header h2 or h3
    for element in content_div.find_all(["p", "h2", "h3"]):
        if element.name == "p":
            text = element.get_text().strip()
            if text and not text.isspace():
                the_description = convert_to_markdown(str(element))
                the_description = the_description.strip()
                # print(f"Found description for {name}: {the_description}")
                break
        elif element.name in ["h2", "h3"]:
            # Stop at the first header
            break
    
    if not the_description:
        # Alternatively, look for content inside a div that has style="padding: 4px 8px"
        divs = content_div.find_all("div", style="padding: 4px 8px")
        for div in divs:
            text = div.get_text()
            if text and not text.isspace():
                the_description = convert_to_markdown(str(div))
                the_description = the_description.strip()
                # print(f"Found description in div for {name}: {the_description}")
                break
    
    return the_description
    

def parse_event_page(page_url: str, category: str, name: str, source: str) -> dict:
    response = requests.get(page_url)
    soup = BeautifulSoup(response.text, "html.parser")

    # Find first non-empty p inside mw-content-text
    content_div = soup.find("div", id="mw-content-text")
    if not content_div:
        raise ValueError(f"Could not find content in {page_url}")

    event_type = "client" if "Client" in source else "server"
    
    event_description = parse_description(content_div)
    if event_description is None:
        raise ValueError(f"Could not find a valid description for {name} in {page_url}")

    # Event parameters are optional, there may be none
    event_parameters = []
    parameters_header = content_div.find("span", id="Parameters")

    if parameters_header:
        params = []
        next_element = parameters_header.find_next()

        # Traverse siblings until we find a <pre> or a header (<h2> or <h3>)
        while next_element:
            if next_element.name in ["h2", "h3"]:
                break  # Another section begins
            if next_element.name == "pre":
                # Found the relevant <pre> block
                pre_text = next_element.get_text().strip()
                # Remove [ and ] from the pre_text
                pre_text = pre_text.replace("[", "").replace("]", "")
                param_lines = pre_text.split(",")

                for line in param_lines:
                    line = line.strip()
                    if line:
                        parts = line.split(" ", 1)
                        if len(parts) == 2:
                            param_type, param_name = parts
                            params.append({
                                "name": param_name.strip(),
                                "type": param_type.strip(),
                                "description": "MISSING_PARAM_DESC"
                            })

                # Now look for adjacent <ul>s or <div class="new-feature-item"> containing <ul>
                ul_element = next_element.find_next_sibling()
                while ul_element:
                    if ul_element.name in ["h2", "h3", "pre"]:
                        break  # Reached unrelated content

                    if ul_element.name == "ul":
                        ul_blocks = [ul_element]
                    elif ul_element.name == "div" and any(cls in ul_element.get("class", []) for cls in ["new-feature-item", "new-items"]):
                        # Look for <ul> inside this special div
                        ul_blocks = ul_element.find_all("ul", recursive=True)
                    else:
                        ul_blocks = []

                    for ul in ul_blocks:
                        for li in ul.find_all("li"):
                            b_tag = li.find("b")
                            if b_tag:
                                param_name = b_tag.text.strip().replace(":", "")
                                for param in params:
                                    if param["name"] == param_name:
                                        description_parts = li.get_text().split(":", 1)
                                        if len(description_parts) > 1:
                                            param["description"] = description_parts[1].strip()
                                        break

                    ul_element = ul_element.find_next_sibling()

                break  # Done processing this parameters section

            next_element = next_element.find_next_sibling()

        event_parameters = params
    
    event_source = None
    source_header = content_div.find("span", id="Source")
    if source_header:
        source_paragraph = source_header.find_next("p")
        if source_paragraph:
            source_text = source_paragraph.get_text().strip()
            if source_text:
                # Remove new lines from the source text
                source_text = source_text.replace("\n", " ")
                event_source = {
                    "type": "element",
                    "description": source_text
                }
    if not event_source:
        raise ValueError(f"Could not find a valid source for {name}")
    
    event_canceling = None
    canceling_header = content_div.find("span", id="Canceling") or content_div.find("span", id="Cancelling") or content_div.find("span", id="Cancel_effect") or content_div.find("span", id="Cancel_effects") or content_div.find("span", id="Cancel_Effect") or content_div.find("span", id="Cancel_Effects")
    if canceling_header:
        # Extract text
        canceling_paragraph = canceling_header.find_next("p")
        if canceling_paragraph:
            canceling_text = canceling_paragraph.get_text().strip()
            if canceling_text:
                # Remove new lines from the canceling text
                event_canceling = canceling_text.replace("\n", " ")

    # Examples
    examples = parse_examples(content_div)
    if len(examples) == 0:
        print(f"Found no examples for {name}")

    # For each example, create a .lua file with the code
    # with name eventName-index.lua
    example_index = 1
    added_examples = []
    for example in examples:
        example_code = example.get("code", "").strip()
        if example_code:
            example_filename = f"{name}-{example_index}.lua"
            example_path = os.path.join(EVENTS_DIR, category, 'examples', example_filename)
            os.makedirs(os.path.dirname(example_path), exist_ok=True)
            with open(example_path, "w", encoding="utf-8") as example_file:
                example_file.write(example_code)
            example_description = example.get("description", "").strip()
            added_examples.append({
                "path": 'examples/' + example_filename,
                "description": example_description,
                "side": example.get("type") or event_type # Default to event_type if not specified
            })
            example_index += 1

    event_notes, event_meta = parse_notes(content_div)

    yaml_dict = {
        "name": name,
        "type": event_type,
        "source_element": event_source,
        "description": event_description,
        "parameters": event_parameters,
        "examples": added_examples,
    }
    if event_canceling:
        yaml_dict["canceling"] = event_canceling
    if event_notes:
        yaml_dict["notes"] = event_notes
    if event_meta:
        yaml_dict["meta"] = event_meta

    # Set incomplete to true if no description is found for at least one parameter
    if any(param["description"] == "MISSING_PARAM_DESC" for param in event_parameters):
        yaml_dict["incomplete"] = True
    
    return yaml_dict

def parse_function_page(page_url: str, category: str, name: str, source: str) -> dict:
    response = requests.get(page_url)
    soup = BeautifulSoup(response.text, "html.parser")
    content_div = soup.find("div", id="mw-content-text")
    if not content_div:
        raise ValueError(f"Could not find content in {page_url}")

    func_type = "shared" if "Shared" in source else "server" if "Server" in source else "client"

    func_description = parse_description(content_div)
    if func_description is None:
        raise ValueError(f"Could not find a valid description for {name} in {page_url}")
    
    func_notes, func_meta = parse_notes(content_div)

    yaml_dict = {
        func_type: {
            "name": name,
            "description": func_description,
            "parameters": [],
            "examples": [],
            "notes": func_notes,
            "meta": func_meta
        }
    }

    # if source.startswith("Shared"):
    #     yaml_content = "shared: &shared\n"
    #     yaml_content += f"  incomplete: true\n"
    #     yaml_content += f"  name: {name}\n"
    #     yaml_content += f"  description: TODO\n"
    #     yaml_content += "\nserver:\n  <<: *shared"
    #     yaml_content += "\nclient:\n  <<: *shared"
    # elif source.startswith("Server"):
    #     yaml_content = "server:\n"
    #     yaml_content += f"  incomplete: true\n"
    #     yaml_content += f"  name: {name}\n"
    #     yaml_content += f"  description: TODO\n"
    # elif source.startswith("Client"):
    #     yaml_content = "client:\n"
    #     yaml_content += f"  incomplete: true\n"
    #     yaml_content += f"  name: {name}\n"
    #     yaml_content += f"  description: TODO\n"

    return yaml_dict

def convert_page_to_yaml(page_url: str, category: str, name: str, source: str) -> str:
    # This scrapes the page and tries to parse the MediaWiki content into a YAML format for the function/event
    
    is_function = "function" in source.lower()
    is_event = "event" in source.lower()
    if not (is_function or is_event):
        raise ValueError("Source must be either a function or an event.")
    
    if is_event:
        yaml_dict = parse_event_page(page_url, category, name, source)

    elif is_function:
        yaml_dict = parse_function_page(page_url, category, name, source)
        
    return yaml.safe_dump(yaml_dict,
        sort_keys=False,
        allow_unicode=True,
        default_flow_style=False)

def parse_items_by_source(base_dir, data_by_source):
    for source, categories in data_by_source.items():
        print(f"Parsing individual pages of {source}...")
        for category, entries in categories.items():
            dir_path = os.path.join(base_dir, category)
            os.makedirs(dir_path, exist_ok=True)

            for entry in entries:
                page_url, name = entry
                filename = os.path.join(dir_path, f"{name}.yaml")
                file_content = f"# Scraped from: {page_url}\n"
                try:
                    with open(filename, "w", encoding="utf-8") as f:
                        file_content += convert_page_to_yaml(page_url, category, name, source)
                        f.write(file_content)
                except Exception as e:
                    print(e)
                    # Cancel and continue to next entry, closing/deleting file if needed
                    if os.path.exists(filename):
                        os.remove(filename)
                    
        print(f"YAML & Lua files for {source} written successfully to {base_dir}.")

def main():
    functions_by_source = {}
    events_by_source = {}

    # Functions
    # functions_by_source["Shared functions"] = parse_links("Shared functions", URL_SHARED_FUNCS)
    # functions_by_source["Client functions"] = parse_links("Client functions", URL_CLIENT_FUNCS)
    # functions_by_source["Server functions"] = parse_links("Server functions", URL_SERVER_FUNCS)
    
    # TEST Parse only these:
    # functions_by_source["Shared functions"] = {
    #     "Element": [
    #         ("https://wiki.multitheftauto.com/wiki/SetElementParent", "setElementParent"),
    #     ]
    # }

    # Events
    events_by_source["Client events"] = parse_links("Client events", URL_CLIENT_EVENTS)
    events_by_source["Server events"] = parse_links("Server events", URL_SERVER_EVENTS)

    # Empty output directory
    if os.path.exists("./output"):
        shutil.rmtree("./output")

    parse_items_by_source(FUNCTIONS_DIR, functions_by_source)
    parse_items_by_source(EVENTS_DIR, events_by_source)

if __name__ == "__main__":
    main()
