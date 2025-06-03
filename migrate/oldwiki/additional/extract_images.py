import os
import requests
import shutil
from urllib.parse import urljoin, urlparse
from bs4 import BeautifulSoup

url = "https://wiki.multitheftauto.com/wiki/Weather"
filter_str = "Weather_" # Filter for images that containing this string in src
remove_prefix_str = '150px-Weather_'

def download_filtered_images(download_folder="images"):
    # Create folder if it doesn't exist or clear it if it does
    if not os.path.exists(download_folder):
        os.makedirs(download_folder)
    else:
        shutil.rmtree(download_folder)
        os.makedirs(download_folder)


    # Request the webpage content
    response = requests.get(url)
    response.raise_for_status()  # Raise error if request failed

    # Parse HTML
    soup = BeautifulSoup(response.text, "html.parser")

    # Find all image tags
    images = soup.find_all("img")

    downloaded = 0
    for img in images:
        src = img.get("src")
        if not src:
            continue

        # Check if filter string is in the image path (src)
        if filter_str in src:
            # Construct full URL if src is relative
            img_url = urljoin(url, src)

            # Extract image filename
            filename = os.path.basename(urlparse(img_url).path)
            if not filename:
                filename = f"image_{downloaded}.jpg"

            if filename.startswith(remove_prefix_str):
                filename = filename[len(remove_prefix_str):]

            # Download and save the image
            try:
                img_resp = requests.get(img_url)
                img_resp.raise_for_status()
                with open(os.path.join(download_folder, filename), "wb") as f:
                    f.write(img_resp.content)
                print(f"Downloaded: {filename}")
                downloaded += 1
            except Exception as e:
                print(f"Failed to download {img_url}: {e}")

    if downloaded == 0:
        print("No images found matching the filter.")

if __name__ == "__main__":
    download_filtered_images()
