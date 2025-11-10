import os

MIGRATE_FUNCTIONS = "./output/functions"
MIGRATE_EVENTS = "./output/events"

OUTPUT_FUNCTIONS = "../../functions"
OUTPUT_EVENTS = "../../events"

def copy_files(page_type, source_dir, target_dir):
    for root, dirs, files in os.walk(source_dir):
        for file in files:
            if file.endswith(".yaml"):
                src_path = os.path.join(root, file)
                rel_path = os.path.relpath(src_path, source_dir)
                dest_path = os.path.join(target_dir, rel_path)

                if not os.path.exists(dest_path):
                    # Don't copy because it doesn't exist in the output
                    print(f"(YAML) Skipping {dest_path} because it doesn't exist in the output")
                    continue
                else:
                    with open(dest_path, 'r', encoding='utf-8') as dest_file:
                        content = dest_file.read()
                        if 'incomplete: true' not in content:
                            print(f"(YAML) Skipping {dest_path} because it's not marked as incomplete")
                            continue
                
                os.makedirs(os.path.dirname(dest_path), exist_ok=True)
                print(f"(YAML) Copying {src_path} to {dest_path}")
                with open(src_path, 'r', encoding='utf-8') as src_file:
                    with open(dest_path, 'w', encoding='utf-8') as dest_file:
                        src_file_content = src_file.read()
                        # Hack: replace name: y with name: "y"
                        # because that's a YAML reserved keyword xD
                        src_file_content = src_file_content.replace("name: y", 'name: "y"')
                        dest_file.write(src_file_content)

            elif file.endswith(".lua"):
                # Copy all .lua files too
                src_path = os.path.join(root, file)
                rel_path = os.path.relpath(src_path, source_dir)
                dest_path = os.path.join(target_dir, rel_path)
                os.makedirs(os.path.dirname(dest_path), exist_ok=True)
                print(f"(Lua) Copying {src_path} to {dest_path}")
                with open(src_path, 'r', encoding='utf-8') as src_file:
                    with open(dest_path, 'w', encoding='utf-8') as dest_file:
                        dest_file.write(src_file.read())

if __name__ == "__main__":
    # Copy all generated YAML files from the old wiki migration to the definitive folders
    
    print("Copying functions...")
    copy_files('functions', MIGRATE_FUNCTIONS, OUTPUT_FUNCTIONS)

    # print("Copying events...")
    # copy_files('events', MIGRATE_EVENTS, OUTPUT_EVENTS)
    
    print("Copy completed.")
