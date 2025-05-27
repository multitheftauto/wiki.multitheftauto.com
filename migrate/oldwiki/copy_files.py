import os

MIGRATE_FUNCTIONS = "./output/functions"
MIGRATE_EVENTS = "./output/events"

OUTPUT_FUNCTIONS = "../../functions"
OUTPUT_EVENTS = "../../events"

OVERRIDE_EXISTING = False # Set to True to override existing files

def copy_files(source_dir, target_dir):
    for root, dirs, files in os.walk(source_dir):
        for file in files:
            if file.endswith(".yaml"):
                src_path = os.path.join(root, file)
                rel_path = os.path.relpath(src_path, source_dir)
                dest_path = os.path.join(target_dir, rel_path)
                # Ignore if the destination file already exists
                if (OVERRIDE_EXISTING == False) and os.path.exists(dest_path):
                    print(f"Skipping {dest_path} as it already exists.")
                    continue
                os.makedirs(os.path.dirname(dest_path), exist_ok=True)
                # print(f"Copying {src_path} to {dest_path}")
                with open(src_path, 'r', encoding='utf-8') as src_file:
                    with open(dest_path, 'w', encoding='utf-8') as dest_file:
                        dest_file.write(src_file.read())

if __name__ == "__main__":
    # Copy all generated YAML files from the old wiki migration to the definitive folders
    print("Copying functions...")
    copy_files(MIGRATE_FUNCTIONS, OUTPUT_FUNCTIONS)

    print("Copying events...")
    copy_files(MIGRATE_EVENTS, OUTPUT_EVENTS)
    
    print("Copy completed.")
