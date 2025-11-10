import os
import shutil

MIGRATE_FUNCTIONS = "./output/functions"
MIGRATE_EVENTS = "./output/events"

OUTPUT_FUNCTIONS = "../../functions"
OUTPUT_EVENTS = "../../events"

# Set this to True to copy to a temporary directory first
# Then you can manually review the copied files before moving them to the final destination
COPY_TO_TEMP_DIR = True
TEMP_DIR = "./temp_copy"

def copy_files(page_type, source_dir, target_dir):
    
    copied_function_names = set()
    # First copy YAML files
    for root, dirs, files in os.walk(source_dir):
        for file in files:
            if file.endswith(".yaml"):
                src_path = os.path.join(root, file)
                rel_path = os.path.relpath(src_path, source_dir)
                dest_path = os.path.join(target_dir, rel_path)
                copy_to_dest_path = os.path.join(TEMP_DIR, page_type, rel_path) if COPY_TO_TEMP_DIR else dest_path

                if os.path.exists(dest_path):
                    with open(dest_path, 'r', encoding='utf-8') as dest_file:
                        content = dest_file.read()
                        if 'incomplete: true' not in content:
                            print(f"(YAML) Skipping {dest_path} because it is not incomplete")
                            continue
                
                os.makedirs(os.path.dirname(copy_to_dest_path), exist_ok=True)
                print(f"(YAML) Copying {src_path} to {copy_to_dest_path}")
                with open(src_path, 'r', encoding='utf-8') as src_file:
                    with open(copy_to_dest_path, 'w', encoding='utf-8') as dest_file:
                        src_file_content = src_file.read()
                        # Hack: replace name: y with name: "y"
                        # because that's a YAML reserved keyword xD
                        src_file_content = src_file_content.replace("name: y", 'name: "y"')
                        dest_file.write(src_file_content)
                        copied_function_names.add(file[:-5])  # Remove .yaml extension

    # Copy corresponding .lua files too
    for root, dirs, files in os.walk(source_dir):
        for file in files:
            if file.endswith(".lua"):
                # Ignore if we haven't copied the corresponding YAML file
                function_name = file[:-4]  # Remove .lua extension
                if function_name not in copied_function_names:
                    print(f"(Lua) Skipping {file} because corresponding YAML was not copied")
                    continue
                src_path = os.path.join(root, file)
                rel_path = os.path.relpath(src_path, source_dir)
                dest_path = os.path.join(target_dir, rel_path)
                copy_to_dest_path = os.path.join(TEMP_DIR, page_type, rel_path) if COPY_TO_TEMP_DIR else dest_path
                os.makedirs(os.path.dirname(dest_path), exist_ok=True)
                print(f"(Lua) Copying {src_path} to {copy_to_dest_path}")
                with open(src_path, 'r', encoding='utf-8') as src_file:
                    with open(copy_to_dest_path, 'w', encoding='utf-8') as dest_file:
                        dest_file.write(src_file.read())

if __name__ == "__main__":
    # Copy all generated YAML files from the old wiki migration to the definitive folders

    if COPY_TO_TEMP_DIR:
        if os.path.exists(TEMP_DIR):
            shutil.rmtree(TEMP_DIR)
        os.makedirs(TEMP_DIR, exist_ok=True)
    
    print("Copying functions...")
    copy_files('functions', MIGRATE_FUNCTIONS, OUTPUT_FUNCTIONS)

    # print("Copying events...")
    # copy_files('events', MIGRATE_EVENTS, OUTPUT_EVENTS)
    
    print("Copy completed.")
