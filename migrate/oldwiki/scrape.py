# Comments:
# - Running without skipping cache for the 1st time will take a while, but subsequent runs will be much faster
# - Parsing functions takes a lot longer than events because there's a lot more

import requests
from bs4 import BeautifulSoup
from html_to_markdown import convert_to_markdown
import yaml

import time
import os
import shutil

# Cache of event/function Wiki pages
SKIP_CACHE = False # Set to True to skip cache and always fetch fresh pages
PAGES_CACHE_DIR = "./cache/pages"

# Function listings URLs
URL_CLIENT_FUNCS = "https://wiki.multitheftauto.com/wiki/Client_Scripting_Functions"
URL_SERVER_FUNCS = "https://wiki.multitheftauto.com/wiki/Server_Scripting_Functions"
URL_SHARED_FUNCS = "https://wiki.multitheftauto.com/wiki/Shared_Scripting_Functions"

# Event listings URLs
URL_CLIENT_EVENTS = "https://wiki.multitheftauto.com/wiki/Client_Scripting_Events"
URL_SERVER_EVENTS = "https://wiki.multitheftauto.com/wiki/Server_Scripting_Events"

# Output directories
FUNCTIONS_DIR = "./output/functions"
EVENTS_DIR = "./output/events"

# Rename some categories
CATEGORY_CORRECTIONS = {
    'SQL': 'Database',
    'Collision_shape': 'Colshape',
}

# Don't include these items from the listings
NAME_BLACKLIST = [
    'Matrix',
    'Vector'
]

log_filename = f"./logs/scrape_log_{time.strftime('%Y%m%d_%H%M%S', time.localtime())}.log"
log_file = open(log_filename, "a", encoding="utf-8")

def log(message: str):
    global log_file
    timestamp = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
    log_entry = f"[{timestamp}] {message}"
    print(log_entry)
    log_file.write(log_entry + "\n")

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
    log(f"Parsing list of {source_label} ...")

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
                    # Check if name not in any result category
                    foundInCat = False
                    for cat, entries in result.items():
                        if any(entry[1] == name for entry in entries):
                            foundInCat = cat
                            break
                    if not foundInCat:
                        result[current_category].append((page_url, name))
                    else:
                        log(f"=> Function {name} already found in category {foundInCat}, skipping duplicate in {current_category}.")

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

    # Additional hack: find section 'Remarks' and extract content into info notes
    remarks_header = content_div.find("span", id="Remarks")
    if remarks_header:
        # get all p next to it before the following header
        current = remarks_header.find_parent(["h2", "h3"]).find_next_sibling()
        remarks_texts = []
        while current:
            if current.name in ["h2", "h3"]:
                break
            if current.name == "p":
                remarks_texts.append(current.get_text(" ", strip=True))
            current = current.find_next_sibling()
        if remarks_texts:
            for remarks_text in remarks_texts:
                note_boxes.append({
                    "type": "note",
                    "text": remarks_text
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
                # log(f"Found description for {name}: {the_description}")
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
                # log(f"Found description in div for {name}: {the_description}")
                break
    
    return the_description

def parse_issues(content_div):
    issues = []
    for a in content_div.find_all("a", href=True):
        # Ignore if parent div has class "note-messagebox"
        if "note-messagebox" in a.find_parent("div").get("class", []):
            continue
        href = a["href"]
        if "github.com/multitheftauto/mtasa-blue/issues/" in href:
            issue_number = href.split("/")[-1]
            # Find the next td, that is the description
            issue_desc = "TODO"
            next_td = a.find_next("td")
            if next_td:
                issue_desc = next_td.get_text(strip=True)
            issues.append({
                "id": issue_number,
                "description": issue_desc
            })
    return issues

def get_page_from_cache_or_fetch(page_url: str, page_name: str) -> str:
    """Get the page content from cache or fetch it if not cached."""
    cache_file = os.path.join(PAGES_CACHE_DIR, f"{page_name}.html")
    if (not SKIP_CACHE) and os.path.exists(cache_file):
        with open(cache_file, "r", encoding="utf-8") as f:
            return f.read()
    else:
        # Fetch and cache the page
        response = requests.get(page_url)
        if response.status_code == 200:
            with open(cache_file, "w", encoding="utf-8") as f:
                f.write(response.text)
            return response.text
        else:
            raise ValueError(f"Failed to fetch {page_url}: {response.status_code}")

def get_additional_headers_found_in_page(content_div, handled_header_names, page_url):
    """Print any additional headers found in the content_div that were not handled."""
    additional_headers = []
    # Ignore headers from see also
    IGNORE_WORDS = [
        "see also", "events", "functions", "changelog",
        "game processing order", "input", "gui",
        "browsers", "buttons", "checkboxes", "comboboxes",
        "edit boxes", "gridlists", "memos", "progressbars", "radio buttons",
        "scrollbars", "scrollpanes", "static images", "tab Panels", "tabs",
        "tab panels", "text labels", "windows"
    ]
    for header in content_div.find_all(["h2", "h3"]):
        header_text = header.get_text(strip=True)
        if header_text and header_text not in handled_header_names:
            header_text_lower = header_text.lower()
            # Ignore some headers that are not relevant
            if any(ignore_word in header_text_lower for ignore_word in IGNORE_WORDS):
                continue
            additional_headers.append(header_text)
    
    if additional_headers:
        log(f"Other headers found in {page_url}:")
        log(f" {', '.join(additional_headers)}")
        return additional_headers
    return False

def parse_event_page(page_url: str, category: str, name: str, source: str) -> dict:
    response_text = get_page_from_cache_or_fetch(page_url, name)
    
    soup = BeautifulSoup(response_text, "html.parser")

    # Find first non-empty p inside mw-content-text
    content_div = soup.find("div", id="mw-content-text")
    if not content_div:
        raise ValueError(f"Could not find content in {page_url}")
    
    stop_if_deprecated(content_div, page_url)

    handled_header_names = []

    event_type = "client" if "Client" in source else "server"
    
    event_description = parse_description(content_div)
    if event_description is None:
        raise ValueError(f"Could not find a valid description for {name} in {page_url}")

    # Event parameters are optional, there may be none
    event_parameters = []
    parameters_header = content_div.find("span", id="Parameters")

    if parameters_header:
        handled_header_names.append("Parameters")
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
        handled_header_names.append("Source")
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
        handled_header_names.append(canceling_header.text.strip())
        # Extract text
        canceling_paragraph = canceling_header.find_next("p")
        if canceling_paragraph:
            canceling_text = canceling_paragraph.get_text().strip()
            if canceling_text:
                # Remove new lines from the canceling text
                event_canceling = canceling_text.replace("\n", " ")

    # Examples
    examples = parse_examples(content_div)
    handled_header_names.append("Examples")
    handled_header_names.append("Example")
    if len(examples) == 0:
        log(f"Event is missing code examples: {page_url}")

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
                "side": example.get("type") or event_type # Default to this if not specified
            })
            example_index += 1

    event_notes, event_meta = parse_notes(content_div)

    # Parse Type section, put it into a note
    type_header = content_div.find("span", id="Type")
    if type_header:
        type_paragraph = type_header.find_next("p")
        if type_paragraph:
            type_text = type_paragraph.get_text().strip()
            if type_text:
                # Remove new lines from the type text
                type_text = type_text.replace("\n", " ")
                # Look for any list after that paragraph
                list_items = type_paragraph.find_next("ul")
                if list_items:
                    prev_header = type_paragraph.find_previous("h2") or type_paragraph.find_previous("h3")
                    if prev_header and prev_header.getText(strip=True) == "Type":
                        # If the header is "Type", we can safely add the list items to the type text
                        type_text += " " + ", ".join(li.get_text(strip=True) for li in list_items.find_all("li"))
                
                event_notes.append({
                    "type": "info",
                    "content": type_text
                })
                handled_header_names.append("Type")

    # Parse Issues
    event_issues = parse_issues(content_div)
    handled_header_names.append("Issues")

    get_additional_headers_found_in_page(content_div, handled_header_names, page_url)

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
    if event_issues:
        yaml_dict["issues"] = event_issues

    if (any(param["description"] == "MISSING_PARAM_DESC" for param in event_parameters)):
        yaml_dict["incomplete"] = True
    
    return yaml_dict

def stop_if_deprecated(content_div, page_url: str):
    deprecated_texts = [
        "This function is deprecated",
        "Function has been disabled",
        "This function is provided by the external",
        "This page is marked for deletion"
        # "BEFORE VERSION",
    ]
    for text in deprecated_texts:
        if content_div.find(string=lambda s: s and text in s):
            raise ValueError(f"Found {text} in {page_url}. Please review manually.")

def parse_function_page(page_url: str, category: str, name: str, source: str) -> dict:
    response_text = get_page_from_cache_or_fetch(page_url, name)

    soup = BeautifulSoup(response_text, "html.parser")
    content_div = soup.find("div", id="mw-content-text")
    if not content_div:
        raise ValueError(f"Could not find content in {page_url}")
    
    stop_if_deprecated(content_div, page_url)

    handled_header_names = []

    func_type = "shared" if "Shared" in source else "server" if "Server" in source else "client"

    func_description = parse_description(content_div)
    if func_description is None:
        raise ValueError(f"Could not find a valid description for {name} in {page_url}")
    
    func_pair = None
    counterpart_b = content_div.find("b", string="Counterpart")
    if counterpart_b:
        i_tag = counterpart_b.find_next("i")
        if i_tag and i_tag.a:
            func_pair = i_tag.a.text.strip()
    
    func_notes, func_meta = parse_notes(content_div)
    handled_header_names.append("Remarks")

    # TODO: Syntax: parameters and returns
    # also ignore_parameters if needed
    handled_header_names.append("Syntax")
    handled_header_names.append("Parameters")
    handled_header_names.append("Arguments")
    handled_header_names.append("Required Arguments")
    handled_header_names.append("Required arguments")
    handled_header_names.append("Optional Arguments")
    handled_header_names.append("Optional arguments")
    handled_header_names.append("Returns")
    # TODO parse OOP syntax

    
    # Examples
    examples = parse_examples(content_div)
    handled_header_names.append("Examples")
    handled_header_names.append("Example")
    # if len(examples) == 0:
    #     log(f"Function is missing code examples: {page_url}")
    
    example_index = 1
    added_examples = []
    for example in examples:
        example_code = example.get("code", "").strip()
        if example_code:
            example_filename = f"{name}-{example_index}.lua"
            example_path = os.path.join(FUNCTIONS_DIR, category, 'examples', example_filename)
            os.makedirs(os.path.dirname(example_path), exist_ok=True)
            with open(example_path, "w", encoding="utf-8") as example_file:
                example_file.write(example_code)
            example_description = example.get("description", "").strip()
            added_examples.append({
                "path": 'examples/' + example_filename,
                "description": example_description,
                "side": example.get("type") or func_type # Default to this if not specified
            })
            example_index += 1

    # Parse Issues
    func_issues = parse_issues(content_div)
    handled_header_names.append("Issues")

    extra_headers = get_additional_headers_found_in_page(content_div, handled_header_names, page_url)

    yaml_dict = {
        func_type: {
            "name": name,
            "description": func_description,
            "parameters": [],
            "examples": added_examples,
        }
    }
    if func_pair:
        yaml_dict[func_type]["pair"] = func_pair
    if func_notes:
        yaml_dict[func_type]["notes"] = func_notes
    if func_meta:
        yaml_dict[func_type]["meta"] = func_meta
    if func_issues:
        yaml_dict[func_type]["issues"] = func_issues

    if extra_headers:
        yaml_dict[func_type]["incomplete"] = True
        yaml_dict[func_type]["meta"] = yaml_dict.get("meta", [])
        headears_missing = "This function was partially migrated from the old wiki. Please review manually:\n"
        for header in extra_headers:
            headears_missing += f"- Missing section: {header}\n"
        yaml_dict[func_type]["meta"].append({
            "needs_checking": headears_missing
        })

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
        started_at = time.time()
        log(f"»»» Parsing individual pages of {source}...")
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
                    log(e)
                    # Cancel and continue to next entry, closing/deleting file if needed
                    if os.path.exists(filename):
                        os.remove(filename)
                    
        log(f">> Parsed individual pages of {source} in {time.time() - started_at:.2f} seconds.\n")

def main():
    # Create cache directory if it doesn't exist
    if not os.path.exists(PAGES_CACHE_DIR):
        os.makedirs(PAGES_CACHE_DIR)
    log(f"SKIP_CACHE is set to {SKIP_CACHE}")
    
    functions_by_source = {}
    events_by_source = {}

    # Functions
    functions_by_source["Shared functions"] = parse_links("Shared functions", URL_SHARED_FUNCS)
    functions_by_source["Client functions"] = parse_links("Client functions", URL_CLIENT_FUNCS)
    functions_by_source["Server functions"] = parse_links("Server functions", URL_SERVER_FUNCS)
    
    # TEST Parse only these:
    # functions_by_source["Shared functions"] = {
    #     "Player": [
    #         ("https://wiki.multitheftauto.com/wiki/SetPlayerName", "setPlayerName"),
    #     ]
    # }

    # Events
    # events_by_source["Client events"] = parse_links("Client events", URL_CLIENT_EVENTS)
    # events_by_source["Server events"] = parse_links("Server events", URL_SERVER_EVENTS)

    # Empty output directory
    if os.path.exists("./output"):
        shutil.rmtree("./output")

    log(" ")

    parse_items_by_source(FUNCTIONS_DIR, functions_by_source)
    parse_items_by_source(EVENTS_DIR, events_by_source)

    # Close log file
    log_file.close()

if __name__ == "__main__":
    main()

