# Comments:
# - Running without skipping cache for the 1st time will take a while, but subsequent runs will be much faster
# - Parsing functions takes a lot longer than events because there's a lot more

import requests
from bs4 import BeautifulSoup
from html_to_markdown import convert_to_markdown
import yaml
import re

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
                "id": int(issue_number),
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

def parse_function_syntax(content_div, page_url: str):
    """Parse function syntax section(s). Returns list of syntax objects."""
    syntax_header = content_div.find("span", id="Syntax")
    if not syntax_header:
        return []
    
    syntax_variants = []
    
    # Check if syntax is split by client/server sections
    syntax_h2 = syntax_header.find_parent("h2")
    if not syntax_h2:
        return []
    
    # Look for section divs (client/server specific syntax)
    current = syntax_h2.find_next_sibling()
    found_sections = False
    
    while current:
        if current.name in ["h2", "h3"]:
            # Reached next major section
            break
        
        # Check for server/client header divs
        if current.name == "div" and "serverHeader" in current.get("class", []):
            found_sections = True
            # Find the corresponding content div
            content_div_section = current.find_next_sibling()
            if content_div_section and content_div_section.get("id", "").startswith("section"):
                pre_tag = content_div_section.find("pre", class_=lambda x: x and "prettyprint" in x and "lang-lua" in x)
                if pre_tag:
                    syntax_line = pre_tag.get_text(strip=True)
                    syntax_variants.append({
                        "type": "server",
                        "syntax_line": syntax_line,
                        "section_element": content_div_section
                    })
        
        elif current.name == "div" and "clientHeader" in current.get("class", []):
            found_sections = True
            # Find the corresponding content div
            content_div_section = current.find_next_sibling()
            if content_div_section and content_div_section.get("id", "").startswith("section"):
                pre_tag = content_div_section.find("pre", class_=lambda x: x and "prettyprint" in x and "lang-lua" in x)
                if pre_tag:
                    syntax_line = pre_tag.get_text(strip=True)
                    syntax_variants.append({
                        "type": "client",
                        "syntax_line": syntax_line,
                        "section_element": content_div_section
                    })
        
        current = current.find_next_sibling()
    
    # If no sections found, look for a single shared syntax
    if not found_sections:
        # Look for pre tag directly after syntax header
        current = syntax_h2.find_next_sibling()
        while current:
            if current.name in ["h2", "h3"]:
                break
            if current.name == "pre":
                classes = current.get("class", [])
                if any("prettyprint" in str(c) for c in classes) and any("lang-lua" in str(c) for c in classes):
                    syntax_line = current.get_text(strip=True)
                    syntax_variants.append({
                        "type": "shared",
                        "syntax_line": syntax_line,
                        "section_element": None  # Parameters/returns are outside sections
                    })
                    break
            current = current.find_next_sibling()
    
    return syntax_variants

def parse_function_parameters(syntax_obj, content_div, page_url: str):
    """Parse function parameters from syntax line and argument sections."""
    syntax_line = syntax_obj["syntax_line"]
    section_element = syntax_obj.get("section_element")
    
    # Parse syntax line to extract parameters
    # Format: returnType functionName ( param1, param2, [ optionalParam = default ] )
    
    # Extract the part inside parentheses
    params_match = re.search(r'\(([^)]*)\)', syntax_line)
    if not params_match:
        return []
    
    params_text = params_match.group(1).strip()
    if not params_text:
        return []
    
    # Split parameters, handling brackets for optional params
    parameters = []
    current_param = ""
    bracket_depth = 0
    
    for char in params_text:
        if char == '[':
            if bracket_depth == 0:
                # We're entering brackets - finalize current parameter first
                if current_param.strip():
                    parameters.append(current_param.strip())
                current_param = ""
            bracket_depth += 1
            current_param += char
        elif char == ']':
            bracket_depth -= 1
            current_param += char
            if bracket_depth == 0:
                # We've closed all brackets - finalize this bracket group
                if current_param.strip():
                    parameters.append(current_param.strip())
                current_param = ""
        elif char == ',' and bracket_depth == 0:
            # Comma outside brackets - split parameter
            if current_param.strip():
                parameters.append(current_param.strip())
            current_param = ""
        else:
            current_param += char
    
    if current_param.strip():
        parameters.append(current_param.strip())
    
    # Parse each parameter to extract type, name, and default
    parsed_params = []
    for param in parameters:
        param = param.strip()
        # Remove brackets for optional params
        is_optional = param.startswith('[') and param.endswith(']')
        if is_optional:
            param = param[1:-1].strip()
            # If the bracket content contains commas, split into multiple optional parameters
            if ',' in param:
                # Split by comma, but be careful with default values that might contain commas
                # We'll split on commas that are not inside parentheses or other brackets
                sub_params = []
                current_sub = ""
                paren_depth = 0
                bracket_depth = 0
                
                for char in param:
                    if char == '(':
                        paren_depth += 1
                        current_sub += char
                    elif char == ')':
                        paren_depth -= 1
                        current_sub += char
                    elif char == '[':
                        bracket_depth += 1
                        current_sub += char
                    elif char == ']':
                        bracket_depth -= 1
                        current_sub += char
                    elif char == ',' and paren_depth == 0 and bracket_depth == 0:
                        if current_sub.strip():
                            sub_params.append(current_sub.strip())
                        current_sub = ""
                    else:
                        current_sub += char
                
                if current_sub.strip():
                    sub_params.append(current_sub.strip())
                
                # Parse each sub-parameter
                for sub_param in sub_params:
                    sub_param = sub_param.strip()
                    default_value = None
                    if '=' in sub_param:
                        parts = sub_param.split('=', 1)
                        sub_param = parts[0].strip()
                        default_value = parts[1].strip()
                    
                    # Extract type and name
                    parts = sub_param.split(None, 1)
                    if len(parts) == 2:
                        param_type, param_name = parts
                        parsed_params.append({
                            "name": param_name.strip(),
                            "type": param_type.strip(),
                            "default": default_value,
                            "is_optional": True
                        })
                    elif len(parts) == 1:
                        parsed_params.append({
                            "name": parts[0].strip(),
                            "type": "unknown",
                            "default": default_value,
                            "is_optional": True
                        })
                continue
        
        # Extract default value if present (for non-bracketed params or single bracketed param)
        default_value = None
        if '=' in param:
            parts = param.split('=', 1)
            param = parts[0].strip()
            default_value = parts[1].strip()
        
        # Extract type and name
        parts = param.split(None, 1)
        if len(parts) == 2:
            param_type, param_name = parts
            parsed_params.append({
                "name": param_name.strip(),
                "type": param_type.strip(),
                "default": default_value,
                "is_optional": is_optional
            })
        elif len(parts) == 1:
            # Sometimes type is omitted, just use the name
            parsed_params.append({
                "name": parts[0].strip(),
                "type": "unknown",
                "default": default_value,
                "is_optional": is_optional
            })
    
    # Now find descriptions from Required/Optional Arguments sections
    search_element = section_element if section_element else content_div
    
    # Find Required Arguments
    required_header = None
    for header in search_element.find_all(["h3"]):
        span = header.find("span", class_="mw-headline")
        if span:
            header_text = span.get_text(strip=True).lower()
            if "required arguments" in header_text or "required arguments" == header_text:
                required_header = header
                break
    
    # Find Optional Arguments
    optional_header = None
    for header in search_element.find_all(["h3"]):
        span = header.find("span", class_="mw-headline")
        if span:
            header_text = span.get_text(strip=True).lower()
            if "optional arguments" in header_text or "optional arguments" == header_text:
                optional_header = header
                break
    
    # Parse required arguments list
    if required_header:
        ul = required_header.find_next_sibling("ul")
        if not ul:
            # Sometimes it's in a div
            next_elem = required_header.find_next_sibling()
            if next_elem and next_elem.name == "div":
                ul = next_elem.find("ul")
        
        if ul:
            for li in ul.find_all("li"):
                b_tag = li.find("b")
                if b_tag:
                    param_name = b_tag.get_text(strip=True).rstrip(":")
                    # Find description after the colon
                    desc_text = li.get_text(" ", strip=True)
                    if ":" in desc_text:
                        desc = desc_text.split(":", 1)[1].strip()
                    else:
                        desc = ""
                    
                    # Match with parsed params
                    for param in parsed_params:
                        if param["name"] == param_name:
                            param["description"] = desc
                            break
    
    # Parse optional arguments list
    if optional_header:
        ul = optional_header.find_next_sibling("ul")
        if not ul:
            # Sometimes it's in a div
            next_elem = optional_header.find_next_sibling()
            if next_elem and next_elem.name == "div":
                ul = next_elem.find("ul")
        
        if ul:
            for li in ul.find_all("li"):
                b_tag = li.find("b")
                if b_tag:
                    param_name = b_tag.get_text(strip=True).rstrip(":")
                    # Find description after the colon
                    desc_text = li.get_text(" ", strip=True)
                    if ":" in desc_text:
                        desc = desc_text.split(":", 1)[1].strip()
                    else:
                        desc = ""
                    
                    # Match with parsed params
                    for param in parsed_params:
                        if param["name"] == param_name:
                            param["description"] = desc
                            break
    
    # Convert to final format
    result = []
    for param in parsed_params:
        param_obj = {
            "name": param["name"],
            "type": param["type"],
            "description": param.get("description", "MISSING_PARAM_DESC")
        }
        if param.get("default"):
            param_obj["default"] = param["default"]
        result.append(param_obj)
    
    return result

def parse_function_returns(syntax_obj, content_div, page_url: str):
    """Parse function return types and description."""
    syntax_line = syntax_obj["syntax_line"]
    section_element = syntax_obj.get("section_element")
    
    # Parse return types from syntax line
    # Format: returnType1, returnType2 functionName ( ... )
    
    # Extract everything before the function name and opening parenthesis
    # Format: returnType1, returnType2 functionName ( ... )
    # Try to match: return types, then function name, then opening paren
    match = re.match(r'^([^(]+?)\s+\w+\s*\(', syntax_line)
    if not match:
        # Try without function name (unlikely but possible)
        match = re.match(r'^([^(]+?)\s*\(', syntax_line)
    
    return_types = []
    if match:
        return_part = match.group(1).strip()
        if return_part and return_part != "void":
            # Split by comma
            return_types = [t.strip() for t in return_part.split(",")]
    
    # Find Returns section
    # First try in section_element if provided, then fall back to main content_div
    # (Returns might be shared and outside client/server sections)
    returns_header = None
    
    if section_element:
        # Search within the section first
        for header in section_element.find_all(["h3"]):
            span = header.find("span", class_="mw-headline")
            if span:
                header_text = span.get_text(strip=True).lower()
                if header_text == "returns":
                    returns_header = header
                    break
    
    # If not found in section, search in main content
    if not returns_header:
        returns_span = content_div.find("span", id="Returns")
        if returns_span:
            returns_header = returns_span.find_parent(["h2", "h3"])
        else:
            # Also try searching all h3 headers in main content
            for header in content_div.find_all(["h3"]):
                span = header.find("span", class_="mw-headline")
                if span:
                    header_text = span.get_text(strip=True).lower()
                    if header_text == "returns":
                        returns_header = header
                        break
    
    return_description = ""
    if returns_header:
        # Get description from paragraph after header
        p = returns_header.find_next_sibling("p")
        if p:
            return_description = p.get_text(" ", strip=True)
        else:
            # Sometimes it's directly in the header's next text
            next_elem = returns_header.find_next_sibling()
            if next_elem:
                return_description = next_elem.get_text(" ", strip=True)
    
    # Create return values array
    return_values = []
    if return_types:
        # If multiple return types, name them sequentially (x, y, z for positions, etc.)
        # For now, use generic names
        for i, ret_type in enumerate(return_types):
            if len(return_types) == 1:
                return_values.append({
                    "type": ret_type,
                    "name": "value"
                })
            else:
                # Use common naming patterns
                if ret_type == "float" and len(return_types) == 3:
                    names = ["x", "y", "z"]
                    return_values.append({
                        "type": ret_type,
                        "name": names[i] if i < len(names) else f"value{i+1}"
                    })
                else:
                    return_values.append({
                        "type": ret_type,
                        "name": f"value{i+1}"
                    })
    elif return_description:
        # Try to infer return type from description
        # Common patterns: "Returns true/false" -> bool, "Returns a..." -> element/string/etc
        desc_lower = return_description.lower()
        if "true" in desc_lower or "false" in desc_lower or "boolean" in desc_lower:
            return_values.append({
                "type": "bool",
                "name": "value"
            })
        elif "element" in desc_lower:
            return_values.append({
                "type": "element",
                "name": "value"
            })
        # If we can't infer, we'll still create the returns object but without values
    
    result = {
        "values": return_values
    }
    if return_description:
        result["description"] = return_description
    
    return result if return_values or return_description else None

def parse_oop_syntax(content_div, page_url: str):
    """Parse OOP Syntax section from function page."""
    # Look for OOP Syntax section
    # It can be in a <p> with <u><b>OOP Syntax</b></u> or just a <dl> structure
    
    oop_dl = None
    
    # First, try to find the OOP Syntax heading
    oop_heading = None
    for p in content_div.find_all("p"):
        u_tag = p.find("u")
        if u_tag:
            b_tag = u_tag.find("b")
            if b_tag and "OOP Syntax" in b_tag.get_text():
                oop_heading = p
                break
    
    if oop_heading:
        # Find the <dl> tag after the heading
        oop_dl = oop_heading.find_next_sibling("dl")
        if not oop_dl:
            # Sometimes it's in the next element
            next_elem = oop_heading.find_next_sibling()
            if next_elem and next_elem.name == "dl":
                oop_dl = next_elem
    
    # If not found, try searching for any <dl> with OOP-related content
    if not oop_dl:
        for dl in content_div.find_all("dl"):
            dds = dl.find_all("dd")
            for dd in dds:
                b_tag = dd.find("b")
                if b_tag:
                    text = b_tag.get_text(strip=True)
                    if text in ["Method", "Variable", "Constructor", "Note", "Counterpart"]:
                        oop_dl = dl
                        break
            if oop_dl:
                break
    
    if not oop_dl:
        return None
    
    oop_data = {}
    
    # Parse <dd> elements
    for dd in oop_dl.find_all("dd"):
        b_tag = dd.find("b")
        if not b_tag:
            continue
        
        label = b_tag.get_text(strip=True)
        i_tag = dd.find("i")
        
        if label == "Note":
            if i_tag:
                note_text = i_tag.get_text(strip=True)
                oop_data["note"] = note_text
        
        elif label == "Method":
            if i_tag:
                # Extract method information
                # Format: <i><a href="...">element</a>:methodName(...)</i>
                # or: <i>Element.methodName(...)</i> for static
                # or: <i><a href="...">ClassName</a>(...)</i> for constructor (mislabeled as Method)
                # or: <i>ClassName(...)</i> for constructor without link
                method_text = i_tag.get_text(strip=True)
                a_tag = i_tag.find("a")
                
                if a_tag:
                    element_name = a_tag.get_text(strip=True)
                    # Get text after the link to determine if it's a constructor
                    # If the link is followed by just (...), it's a constructor
                    link_text = a_tag.get_text()
                    # Get all text nodes in the i_tag
                    all_text = i_tag.get_text()
                    # Check what comes after the link text
                    after_link = all_text[len(link_text):].strip()
                    
                    # Check if it's static (has dot) or instance (has colon)
                    if ":" in method_text:
                        # Instance method: element:methodName
                        method_name = method_text.split(":")[-1].split("(")[0].strip()
                        oop_data["method"] = method_name
                        oop_data["element"] = element_name.lower()
                        oop_data["static"] = False
                    elif "." in method_text and not after_link.startswith("("):
                        # Static method: Element.methodName (has dot and doesn't start with ( after link)
                        method_name = method_text.split(".")[-1].split("(")[0].strip()
                        oop_data["method"] = method_name
                        oop_data["element"] = element_name
                        oop_data["static"] = True
                    elif after_link.startswith("(") or (not "." in method_text and not ":" in method_text):
                        # Constructor: link text followed by (...) or no : or . in method_text
                        # Extract class name from link
                        oop_data["constructorclass"] = element_name
                        # Try to extract element from link href
                        href = a_tag.get("href", "")
                        if href:
                            # Extract from /wiki/ElementName
                            href_element = href.replace("/wiki/", "").split("/")[0]
                            oop_data["element"] = href_element.lower()
                        else:
                            oop_data["element"] = element_name.lower()
                    else:
                        # Fallback: treat as static method if has dot
                        if "." in method_text:
                            method_name = method_text.split(".")[-1].split("(")[0].strip()
                            oop_data["method"] = method_name
                            oop_data["element"] = element_name
                            oop_data["static"] = True
                else:
                    # No link, try to parse from text
                    if ":" in method_text:
                        parts = method_text.split(":")
                        if len(parts) >= 2:
                            element_name = parts[0].strip()
                            method_name = parts[1].split("(")[0].strip()
                            oop_data["method"] = method_name
                            oop_data["element"] = element_name.lower()
                            oop_data["static"] = False
                    elif "." in method_text:
                        parts = method_text.split(".")
                        if len(parts) >= 2:
                            element_name = parts[0].strip()
                            method_name = parts[1].split("(")[0].strip()
                            oop_data["method"] = method_name
                            oop_data["element"] = element_name
                            oop_data["static"] = True
                    else:
                        # No : or . means it's a constructor (ClassName(...))
                        class_name = method_text.split("(")[0].strip()
                        oop_data["constructorclass"] = class_name
                        oop_data["element"] = class_name.lower()
        
        elif label == "Variable":
            if i_tag:
                var_text = i_tag.get_text(strip=True)
                # Remove leading dot if present
                if var_text.startswith("."):
                    var_text = var_text[1:]
                oop_data["variable"] = var_text
        
        elif label == "Constructor":
            if i_tag:
                # Constructor format: <i><a href="...">ClassName</a>(...)</i>
                constructor_text = i_tag.get_text(strip=True)
                a_tag = i_tag.find("a")
                if a_tag:
                    class_name = a_tag.get_text(strip=True)
                    oop_data["constructorclass"] = class_name
                    # Try to extract element from link href
                    href = a_tag.get("href", "")
                    if href:
                        # Extract from /wiki/ElementName
                        element_name = href.replace("/wiki/", "").split("/")[0]
                        oop_data["element"] = element_name
        
        elif label == "Counterpart":
            # Counterpart is just for reference, we already parse it elsewhere
            # But we can note it if needed
            pass
    
    # Ensure element is set (required by schema)
    if "element" not in oop_data:
        # Try to infer from method or constructor
        if "method" in oop_data:
            # Already set above
            pass
        elif "constructorclass" in oop_data:
            # Element should be set from constructor parsing
            pass
        else:
            # Can't determine element, skip OOP
            return None
    
    # Return in schema format
    result = {
        "element": oop_data["element"]
    }
    
    if "note" in oop_data:
        result["note"] = oop_data["note"]
    
    if "constructorclass" in oop_data:
        result["constructorclass"] = oop_data["constructorclass"]
    else:
        if "method" in oop_data:
            result["method"] = oop_data["method"]
        if "variable" in oop_data:
            result["variable"] = oop_data["variable"]
        if "static" in oop_data:
            result["static"] = oop_data["static"]
    
    return result if result else None

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

    # Parse Syntax, Parameters, Returns, and OOP
    syntax_variants = parse_function_syntax(content_div, page_url)
    handled_header_names.append("Syntax")
    handled_header_names.append("Parameters")
    handled_header_names.append("Arguments")
    handled_header_names.append("Required Arguments")
    handled_header_names.append("Required arguments")
    handled_header_names.append("Optional Arguments")
    handled_header_names.append("Optional arguments")
    handled_header_names.append("Returns")
    
    # Parse OOP syntax (typically shared)
    oop_data = parse_oop_syntax(content_div, page_url)
    
    # Parse parameters and returns for each syntax variant
    syntax_data = {}
    for variant in syntax_variants:
        variant_type = variant["type"]
        params = parse_function_parameters(variant, content_div, page_url)
        returns = parse_function_returns(variant, content_div, page_url)
        
        syntax_data[variant_type] = {
            "parameters": params,
            "returns": returns
        }
    
    # If no syntax found, log warning
    if not syntax_variants:
        log(f"Warning: No syntax found for {name} in {page_url}")
    
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

    # Build YAML structure based on syntax variants
    yaml_dict = {}
    
    if "shared" in syntax_data:
        # Single shared syntax
        yaml_dict["shared"] = {
            "name": name,
            "description": func_description,
            "parameters": syntax_data["shared"]["parameters"],
            "examples": added_examples,
        }
        if syntax_data["shared"]["returns"]:
            yaml_dict["shared"]["returns"] = syntax_data["shared"]["returns"]
        if oop_data:
            yaml_dict["shared"]["oop"] = oop_data
        if func_pair:
            yaml_dict["shared"]["pair"] = func_pair
        if func_notes:
            yaml_dict["shared"]["notes"] = func_notes
        if func_meta:
            yaml_dict["shared"]["meta"] = func_meta
        if func_issues:
            yaml_dict["shared"]["issues"] = func_issues
    elif "client" in syntax_data or "server" in syntax_data:
        # Client/server specific syntaxes
        # Check if returns are shared (same for both sides)
        shared_returns = None
        if "client" in syntax_data and "server" in syntax_data:
            client_returns = syntax_data["client"]["returns"]
            server_returns = syntax_data["server"]["returns"]
            if client_returns and server_returns:
                # Compare returns (simple string comparison for now)
                if str(client_returns) == str(server_returns):
                    shared_returns = client_returns
        
        if "client" in syntax_data:
            yaml_dict["client"] = {
                "name": name,
                "description": func_description,
                "parameters": syntax_data["client"]["parameters"],
                "examples": [e for e in added_examples if e.get("side") == "client" or e.get("side") == "shared"],
            }
            if syntax_data["client"]["returns"]:
                yaml_dict["client"]["returns"] = syntax_data["client"]["returns"]
            elif shared_returns:
                yaml_dict["client"]["returns"] = shared_returns
            if oop_data:
                yaml_dict["client"]["oop"] = oop_data
            if func_pair:
                yaml_dict["client"]["pair"] = func_pair
            if func_notes:
                yaml_dict["client"]["notes"] = func_notes
            if func_meta:
                yaml_dict["client"]["meta"] = func_meta
            if func_issues:
                yaml_dict["client"]["issues"] = func_issues
        
        if "server" in syntax_data:
            yaml_dict["server"] = {
                "name": name,
                "description": func_description,
                "parameters": syntax_data["server"]["parameters"],
                "examples": [e for e in added_examples if e.get("side") == "server" or e.get("side") == "shared"],
            }
            if syntax_data["server"]["returns"]:
                yaml_dict["server"]["returns"] = syntax_data["server"]["returns"]
            elif shared_returns:
                yaml_dict["server"]["returns"] = shared_returns
            if oop_data:
                yaml_dict["server"]["oop"] = oop_data
            if func_pair:
                yaml_dict["server"]["pair"] = func_pair
            if func_notes:
                yaml_dict["server"]["notes"] = func_notes
            if func_meta:
                yaml_dict["server"]["meta"] = func_meta
            if func_issues:
                yaml_dict["server"]["issues"] = func_issues
    else:
        # Fallback: use func_type (from source) if no syntax found
        yaml_dict[func_type] = {
            "name": name,
            "description": func_description,
            "parameters": [],
            "examples": added_examples,
        }
        if oop_data:
            yaml_dict[func_type]["oop"] = oop_data
        if func_pair:
            yaml_dict[func_type]["pair"] = func_pair
        if func_notes:
            yaml_dict[func_type]["notes"] = func_notes
        if func_meta:
            yaml_dict[func_type]["meta"] = func_meta
        if func_issues:
            yaml_dict[func_type]["issues"] = func_issues
    
    if extra_headers:
        for key in yaml_dict:
            if "meta" not in yaml_dict[key]:
                yaml_dict[key]["meta"] = []
            headears_missing = "This function was partially migrated from the old wiki. Please review manually:\n"
            for header in extra_headers:
                headears_missing += f"- Missing section: {header}\n"
            yaml_dict[key]["meta"].append({
                "needs_checking": headears_missing
            })

    for key in yaml_dict:
        yaml_dict[key]["requires_review"] = True

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

