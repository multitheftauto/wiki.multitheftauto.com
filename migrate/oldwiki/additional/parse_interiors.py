import requests
from bs4 import BeautifulSoup
from collections import defaultdict

url = "https://wiki.multitheftauto.com/wiki/Interior_IDs"
response = requests.get(url)
soup = BeautifulSoup(response.text, "html.parser")

interiors = []

# Find all relevant tables
tables = soup.find_all("table", class_="wikitable")

for table in tables:
    header_row = table.find("tr")
    if not header_row or not header_row.find("th", colspan="6"):
        continue

    interior_id_text = header_row.find("th").get_text(strip=True)
    if not interior_id_text.startswith("ID"):
        continue

    try:
        interior_id = int(interior_id_text.split()[1])
    except (IndexError, ValueError):
        continue

    rows = table.find_all("tr")[2:]
    for row in rows:
        cols = row.find_all("td")
        if len(cols) != 4:
            continue
        name = cols[0].get_text(strip=True)
        x = float(cols[1].get_text(strip=True))
        y = float(cols[2].get_text(strip=True))
        z = float(cols[3].get_text(strip=True))
        interiors.append({
            "id": interior_id,
            "name": name,
            "x": x,
            "y": y,
            "z": z
        })

# Group by ID
grouped = defaultdict(list)
for i in interiors:
    grouped[i["id"]].append({k: i[k] for k in ("name", "x", "y", "z")})

# Prepare TypeScript output
ts_lines = ["export const interiors = {"]
for interior_id in sorted(grouped.keys()):
    ts_lines.append(f"  {interior_id}: [")
    for entry in grouped[interior_id]:
        ts_lines.append(
            f'    {{ name: "{entry["name"]}", x: {entry["x"]}, y: {entry["y"]}, z: {entry["z"]} }},'
        )
    ts_lines.append("  ],")
ts_lines.append("};\n")

# Write to file
with open("interiors.ts", "w", encoding="utf-8") as f:
    f.write("\n".join(ts_lines))

print("TypeScript file 'interiors.ts' generated.")
