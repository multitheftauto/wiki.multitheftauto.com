import os

FUNCS_DIR = "../../functions"
EVENTS_DIR = "../../events"

def check_duplicates():
    print("Checking duplicate function and event YAML files in the project...")
    func_files = {}
    event_files = {}
    # Print files with same name
    for root, dirs, files in os.walk(FUNCS_DIR):
        for file in files:
            if file.endswith(".yaml"):
                if file not in func_files:
                    func_files[file] = []
                func_files[file].append(os.path.join(root, file))
    for root, dirs, files in os.walk(EVENTS_DIR):
        for file in files:
            if file.endswith(".yaml"):
                if file not in event_files:
                    event_files[file] = []
                event_files[file].append(os.path.join(root, file))
    duplicates_found = False
    for file, paths in func_files.items():
        if len(paths) > 1:
            duplicates_found = True
            print(f"Duplicate function YAML file found: {file}")
            for path in paths:
                print(f" - {path}")
    for file, paths in event_files.items():
        if len(paths) > 1:
            duplicates_found = True
            print(f"Duplicate event YAML file found: {file}")
            for path in paths:
                print(f" - {path}")
    if not duplicates_found:
        print("No duplicate YAML files found.")

if __name__ == "__main__":
    check_duplicates()
