import requests
from bs4 import BeautifulSoup

url = "https://wiki.multitheftauto.com/wiki/Vending"
response = requests.get(url)
soup = BeautifulSoup(response.text, "html.parser")

# Find the vending machine table
table = soup.find("table", class_="wikitable")
rows = table.find_all("tr")[1:]  # Skip header row

vending_machines = []

for row in rows:
    cols = row.find_all("td")
    if len(cols) < 6:
        continue
    model_id = int(cols[0].get_text(strip=True))
    name = cols[1].get_text(strip=True)
    x = float(cols[2].get_text(strip=True))
    y = float(cols[3].get_text(strip=True))
    z = float(cols[4].get_text(strip=True))
    rot_z = float(cols[5].get_text(strip=True))
    vending_machines.append({
        "modelId": model_id,
        "name": name,
        "x": x,
        "y": y,
        "z": z,
        "rotZ": rot_z
    })

# Generate TypeScript variable
ts_lines = ["const vendingMachines = ["]
for v in vending_machines:
    ts_lines.append(
        f'  {{ modelId: {v["modelId"]}, name: "{v["name"]}", x: {v["x"]}, y: {v["y"]}, z: {v["z"]}, rotZ: {v["rotZ"]} }},'
    )
ts_lines.append("];\n")

# Write to file
with open("vendingMachines.ts", "w", encoding="utf-8") as f:
    f.write("\n".join(ts_lines))

print("TypeScript file 'vendingMachines.ts' generated.")
