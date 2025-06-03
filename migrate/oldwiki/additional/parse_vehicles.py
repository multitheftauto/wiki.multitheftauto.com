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

vehicleModelNames = [
	"landstal", "bravura", "buffalo", "linerun", "peren", "sentinel", "dumper", "firetruk", "trash", "stretch", "manana", "infernus", "voodoo", "pony", "mule", "cheetah", "ambulan", "leviathn", "moonbeam", "esperant", "taxi", "washing", "bobcat", "mrwhoop", "bfinject", "hunter", "premier", "enforcer", "securica", "banshee", "predator", "bus", "rhino", "barracks", "hotknife", "artict1", "previon", "coach", "cabbie", "stallion", "rumpo", "rcbandit", "romero", "packer", "monster", "admiral", "squalo", "seaspar", "pizzaboy", "tram", "artict2", "turismo", "speeder", "reefer", "tropic", "flatbed", "yankee", "caddy", "solair", "topfun", "skimmer", "pcj600", "faggio", "freeway", "rcbaron", "rcraider", "glendale", "oceanic", "sanchez", "sparrow", "patriot", "quad", "coastg", "dinghy", "hermes", "sabre", "rustler", "zr350", "walton", "regina", "comet", "bmx", "burrito", "camper", "marquis", "baggage", "dozer", "maverick", "vcnmav", "rancher", "fbiranch", "virgo", "greenwoo", "jetmax", "hotring", "sandking", "blistac", "polmav", "boxville", "benson", "mesa", "rcgoblin", "hotrina", "hotrinb", "bloodra", "rnchlure", "supergt", "elegant", "journey", "bike", "mtbike", "beagle", "cropdust", "stunt", "petro", "rdtrain", "nebula", "majestic", "buccanee", "shamal", "hydra", "fcr900", "nrg500", "copbike", "cement", "towtruck", "fortune", "cadrona", "fbitruck", "willard", "forklift", "tractor", "combine", "feltzer", "remingtn", "slamvan", "blade", "freight", "streak", "vortex", "vincent", "bullet", "clover", "sadler", "firela", "hustler", "intruder", "primo", "cargobob", "tampa", "sunrise", "merit", "utility", "nevada", "yosemite", "windsor", "monstera", "monsterb", "uranus", "jester", "sultan", "stratum", "elegy", "raindanc", "rctiger", "flash", "tahoma", "savanna", "bandito", "freiflat", "streakc", "kart", "mower", "duneride", "sweeper", "broadway", "tornado", "at400", "dft30", "huntley", "stafford", "bf400", "newsvan", "tug", "petrotr", "emperor", "wayfarer", "euros", "hotdog", "club", "freibox", "artict3", "androm", "dodo", "rccam", "launch", "copcarla", "copcarsf", "copcarvg", "copcarru", "picador", "swatvan", "alpha", "phoenix", "glenshit", "sadlshit", "bagboxa", "bagboxb", "tugstair", "boxburg", "farmtr1", "utiltr1"
]


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
                "modelName": vehicleModelNames[id_ - 400]
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
                # f'      {{ id: {v["id"]}, name: "{v["name"]}" }},'
                f'      {{ id: {v["id"]}, name: "{v["name"]}", modelName: "{v["modelName"]}" }},'
            )
        lines.append("    ],")
    lines.append("  },")
lines.append("};\n")

with open("vehicles.ts", "w", encoding="utf-8") as f:
    f.write("\n".join(lines))

print("Done! Vehicle data exported to vehicles.ts and images saved in the vehicle_images directory.")
