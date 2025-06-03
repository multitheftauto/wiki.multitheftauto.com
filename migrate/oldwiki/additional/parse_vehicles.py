import requests
from bs4 import BeautifulSoup
import os
from urllib.parse import urljoin
from collections import defaultdict

BASE_URL = "https://wiki.multitheftauto.com"
TARGET_URL = f"{BASE_URL}/wiki/Vehicle_IDs"
OUTPUT_DIR = "vehicle_images"

os.makedirs(OUTPUT_DIR, exist_ok=True)

print("Fetching Vehicles from MTA Wiki...")

response = requests.get(TARGET_URL)
soup = BeautifulSoup(response.text, "html.parser")

data = defaultdict(lambda: defaultdict(list))

current_category = None
current_subcategory = None

for tag in soup.find_all(["h2", "h3", "table"]):
    if tag.name == "h2":
        headline = tag.find("span", class_="mw-headline")
        if headline:
            current_category = headline.text.strip()
            current_subcategory = None
    elif tag.name == "h3":
        headline = tag.find("span", class_="mw-headline")
        if headline:
            current_subcategory = headline.text.strip()
    elif tag.name == "table" and "wikitable" in tag.get("class", []):
        if not current_category:
            continue
        subcat = current_subcategory or "Uncategorized"
        for row in tag.find_all("tr")[1:]:
            cols = row.find_all("td")
            if len(cols) < 3:
                continue

            name = cols[0].text.strip()
            try:
                id_ = int(cols[1].text.strip())
            except ValueError:
                continue

            # viewer_link = cols[2].find("a")["href"] if cols[2].find("a") else None
            image_src = cols[2].find("img")["src"] if cols[2].find("img") else None

            if image_src:
                image_url = urljoin(BASE_URL, image_src)
                image_path = f"{OUTPUT_DIR}/{id_}.png"
                if not os.path.exists(image_path):
                    img_data = requests.get(image_url).content
                    with open(image_path, "wb") as f:
                        f.write(img_data)

            data[current_category][subcat].append({
                "id": id_,
                "name": name,
                # "image": f"./{OUTPUT_DIR}/{id_}.png",
                # "viewer": viewer_link or "",
            })

# Export to TypeScript
lines = ["const vehicles = {"]
for category, subcats in data.items():
    lines.append(f'  "{category}": {{')
    for subcat, vehicles in subcats.items():
        lines.append(f'    "{subcat}": [')
        for v in vehicles:
            lines.append(
                # f'      {{ id: {v["id"]}, name: "{v["name"]}", image: "{v["image"]}", viewer: "{v["viewer"]}" }},'
                f'      {{ id: {v["id"]}, name: "{v["name"]}" }},'
            )
        lines.append("    ],")
    lines.append("  },")
lines.append("};\n")

with open("vehicles.ts", "w", encoding="utf-8") as f:
    f.write("\n".join(lines))

print("Done! Vehicle data exported to vehicles.ts and images saved in the vehicle_images directory.")
