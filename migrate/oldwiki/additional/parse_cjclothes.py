import os
import re
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin

BASE_URL = "https://wiki.multitheftauto.com"
OUTPUT_TS = "clothingTypes.ts"

PAGES = [
    ("CJ_Clothes\\Shirt_(0)", "Shirt"),
    ("CJ_Clothes\\Head_(1)", "Head"),
    ("CJ_Clothes\\Trousers_(2)", "Trousers"),
    ("CJ_Clothes\\Shoes_(3)", "Shoes"),
    ("CJ_Clothes\\Tattoos:_Left_Upper_Arm_(4)", "Tattoos: Left Upper Arm"),
    ("CJ_Clothes\\Tattoos:_Left_Lower_Arm_(5)", "Tattoos: Left Lower Arm"),
    ("CJ_Clothes\\Tattoos:_Right_Upper_Arm_(6)", "Tattoos: Right Upper Arm"),
    ("CJ_Clothes\\Tattoos:_Right_Lower_Arm_(7)", "Tattoos: Right Lower Arm"),
    ("CJ_Clothes\\Tattoos:_Back_(8)", "Tattoos: Back"),
    ("CJ_Clothes\\Tattoos:_Left_Chest_(9)", "Tattoos: Left Chest"),
    ("CJ_Clothes\\Tattoos:_Right_Chest_(10)", "Tattoos: Right Chest"),
    ("CJ_Clothes\\Tattoos:_Stomach_(11)", "Tattoos: Stomach"),
    ("CJ_Clothes\\Tattoos:_Lower_Back_(12)", "Tattoos: Lower Back"),
    ("CJ_Clothes\\Necklace_(13)", "Necklace"),
    ("CJ_Clothes\\Watches_(14)", "Watches"),
    ("CJ_Clothes\\Glasses_(15)", "Glasses"),
    ("CJ_Clothes\\Hats_(16)", "Hats"),
    ("CJ_Clothes\\Extra_(17)", "Extra")
]

def get_soup(url):
    response = requests.get(url)
    response.raise_for_status()
    return BeautifulSoup(response.text, "html.parser")

def extract_clothing_entries(soup, type_id):
    entries = []

    for td in soup.select("td"):
        inner_table = td.find("table")
        img_tag = td.find("img")

        if not inner_table or not img_tag:
            continue

        try:
            bolds = inner_table.find_all("b")
            index = int(re.search(r"\d+", bolds[0].text).group())
            texture = bolds[1].text.replace("Texture: ", "")
            model = bolds[2].text.replace("Model: ", "")
            img_url = urljoin(BASE_URL, img_tag["src"])
            image_path = f"{type_id}/{index}.jpg"

            entries.append({
                "index": index,
                "texture": texture,
                "model": model,
                "image": image_path,
                "img_url": img_url
            })
        except Exception as e:
            print(f"Skipping one entry due to error: {e}")

    return entries

def download_image(img_url, save_path):
    try:
        r = requests.get(img_url)
        r.raise_for_status()
        with open(save_path, 'wb') as f:
            f.write(r.content)
    except Exception as e:
        print(f"Failed to download {img_url}: {e}")

def main():
    ts_lines = ["export const clothingTypes = ["]

    for page, name in PAGES:
        type_match = re.search(r"\((\d+)\)", page)
        if not type_match:
            continue

        type_id = int(type_match.group(1))

        page_url = urljoin(BASE_URL, f"/wiki/{page}")
        print(f"Scraping: {page_url}")

        soup = get_soup(page_url)
        entries = extract_clothing_entries(soup, type_id)

        dir_path = os.path.join(".", 'cjclothes', str(type_id))
        os.makedirs(dir_path, exist_ok=True)

        ts_lines.append(f"  {{ id: {type_id}, name: '{name}', clothes: [")
        for entry in entries:
            img_path = os.path.join(dir_path, f"{entry['index']}.jpg")
            print(f" -> Saving image for index {entry['index']} to {img_path}")
            download_image(entry["img_url"], img_path)

            ts_lines.append(
                # f"    {{ index: {entry['index']}, texture: '{entry['texture']}', model: '{entry['model']}', image: '{entry['image']}' }},"
                f"    {{ index: {entry['index']}, texture: '{entry['texture']}', model: '{entry['model']}' }},"
            )

        ts_lines.append("  ] },")
    ts_lines.append("];")

    with open(OUTPUT_TS, "w", encoding="utf-8") as f:
        f.write("\n".join(ts_lines))

    print(f"\nDone! TypeScript output written to {OUTPUT_TS}")

if __name__ == "__main__":
    main()
