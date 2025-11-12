# Migrate functions and events from the old wiki

[https://wiki.multitheftauto.com/wiki](https://wiki.multitheftauto.com/)

## Requirements

- Python 3.x
- `pip install -r requirements.txt`

## Usage

- **Scrape**: `python scrape.py`

  This will scrape the old wiki for functions and events by type and category, then generate their .yaml files in the `output` directory.

- **Copy files**: `python copy_files.py`

  This will copy the generated .yaml files to the `/functions` and `/events` directories in the repository root, but before the files are placed in a temporary location for review.
