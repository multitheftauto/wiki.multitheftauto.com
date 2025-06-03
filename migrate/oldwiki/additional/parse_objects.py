import os
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin

BASE_URL = "https://wiki.multitheftauto.com"
TARGET_URL = f"{BASE_URL}/wiki/Object_IDs"
OUTPUT_DIR = "object_images"

os.makedirs(OUTPUT_DIR, exist_ok=True)

response = requests.get(TARGET_URL)
soup = BeautifulSoup(response.text, "html.parser")
content = soup.select_one("#mw-content-text")

img_links = content.select("a[href^='/wiki/File:'] > img[src$='.jpg']")

for img in img_links:
    parent_link = img.find_parent("a")
    file_page_url = urljoin(BASE_URL, parent_link["href"])

    file_page_resp = requests.get(file_page_url)
    file_soup = BeautifulSoup(file_page_resp.text, "html.parser")

    full_image_link = file_soup.select_one("#file > a")

    if full_image_link and full_image_link["href"].lower().endswith(".jpg"):
        full_img_url = urljoin(BASE_URL, full_image_link["href"])
        img_name = os.path.basename(full_img_url)

        save_path = os.path.join(OUTPUT_DIR, img_name)

        if not os.path.exists(save_path):
            print(f"📥 Downloading full image: {img_name}")
            img_data = requests.get(full_img_url).content
            with open(save_path, "wb") as f:
                f.write(img_data)
        else:
            print(f"✔️ Already exists: {img_name}")
    else:
        print(f"⚠️ Couldn't find full image for {file_page_url}")

print("✅ All images downloaded successfully.")
