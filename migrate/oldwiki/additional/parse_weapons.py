import os
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin

BASE_URL = "https://wiki.multitheftauto.com"
TARGET_URL = f"{BASE_URL}/Weapons"
OUTPUT_DIR = "weapon_images"
TS_OUTPUT_FILE = "weapons.ts"

os.makedirs(OUTPUT_DIR, exist_ok=True)

response = requests.get(TARGET_URL)
soup = BeautifulSoup(response.text, "html.parser")

table = soup.select_one("table.wikitable")
weapons = []

# These keep track of rowspan values
current_slot = None
current_type = None
current_ammo = None
current_bsync = None
rowspan_tracker = {
    "slot": 0,
    "type": 0,
    "ammo": 0,
    "bsync": 0
}

rows = table.select("tr")[1:]

for row in rows:
    cells = row.find_all(["td", "th"])
    cell_idx = 0

    # Handle rowspan cells
    if rowspan_tracker["slot"] == 0:
        current_slot = cells[cell_idx].get_text(strip=True)
        rowspan_tracker["slot"] = int(cells[cell_idx].get("rowspan", 1)) - 1
        cell_idx += 1
    else:
        rowspan_tracker["slot"] -= 1

    if rowspan_tracker["type"] == 0:
        current_type = cells[cell_idx].get_text(strip=True)
        rowspan_tracker["type"] = int(cells[cell_idx].get("rowspan", 1)) - 1
        cell_idx += 1
    else:
        rowspan_tracker["type"] -= 1

    # Now parse fixed columns: Image, Name, ID, Model ID, Clip
    if cell_idx + 5 > len(cells):
        continue  # malformed row

    image_tag = cells[cell_idx].select_one("img")
    image_url = urljoin(BASE_URL, image_tag["src"]) if image_tag else None
    image_page = urljoin(BASE_URL, cells[cell_idx].find("a")["href"]) if cells[cell_idx].find("a") else None
    cell_idx += 1

    name = cells[cell_idx].get_text(strip=True)
    cell_idx += 1
    weapon_id = cells[cell_idx].get_text(strip=True)
    cell_idx += 1
    model_id = cells[cell_idx].get_text(strip=True)
    cell_idx += 1
    clip = cells[cell_idx].get_text(strip=True)
    cell_idx += 1

    # Handle ammo sharing
    if rowspan_tracker["ammo"] == 0:
        current_ammo = cells[cell_idx].get_text(strip=True)
        rowspan_tracker["ammo"] = int(cells[cell_idx].get("rowspan", 1)) - 1
        cell_idx += 1
    else:
        rowspan_tracker["ammo"] -= 1

    # Handle bullet sync
    if rowspan_tracker["bsync"] == 0:
        current_bsync = cells[cell_idx].get_text(strip=True)
        rowspan_tracker["bsync"] = int(cells[cell_idx].get("rowspan", 1)) - 1
    else:
        rowspan_tracker["bsync"] -= 1

    # DL images
    
    # image_filename = None
    # if image_page:
    #     img_page_resp = requests.get(image_page)
    #     img_soup = BeautifulSoup(img_page_resp.text, "html.parser")
    #     full_image_tag = img_soup.select_one("#file > a")
    #     if full_image_tag and full_image_tag["href"]:
    #         full_image_url = urljoin(BASE_URL, full_image_tag["href"])
    #         ext = os.path.splitext(full_image_url)[-1]
    #         image_filename = f"{weapon_id}{ext}"
    #         image_path = os.path.join(OUTPUT_DIR, image_filename)

    #         if not os.path.exists(image_path):
    #             img_data = requests.get(full_image_url).content
    #             with open(image_path, "wb") as f:
    #                 f.write(img_data)

    weapons.append({
        "slot": int(current_slot),
        "type": current_type,
        "name": name,
        "id": int(weapon_id),
        "modelId": int(model_id) if model_id.isdigit() else None,
        "clip": clip if clip != "-" else None,
        "sharingAmmoSlot": current_ammo if current_ammo != "-" else None,
        "bulletSync": current_bsync.lower().startswith("yes"),
    })

with open(TS_OUTPUT_FILE, "w", encoding="utf-8") as f:
    f.write("const weapons = ")
    f.write(str(weapons).replace("None", "null").replace("True", "true").replace("False", "false"))
    f.write(";\n")

