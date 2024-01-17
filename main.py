import os
import subprocess
import sys

def create_bin_folder():
    bin_path = "C:/bin"
    
    try:
        os.makedirs(bin_path)
        print(f"Bin folder created at: {bin_path}")
    except FileExistsError:
        print(f"Bin folder already exists at: {bin_path}")

    try:
        current_path = os.environ['PATH']
        if bin_path not in current_path:
            os.environ['PATH'] = f"{bin_path};{current_path}"
            print(f"Bin folder added to the system PATH.")
        else:
            print(f"Bin folder is already in the system PATH.")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    if sys.platform == 'win32':
        if os.name == 'nt':
            try:
                isAdmin = os.environ['USERNAME'] == 'Administrator'
            except KeyError:
                isAdmin = False

            if isAdmin:
                create_bin_folder()
            else:
                subprocess.run(["powershell", f"Start-Process python -ArgumentList '\"{os.path.abspath(sys.argv[0])}\"' -Verb RunAs"])
        else:
            print("This script is intended for Windows.")
    else:
        print("This script is intended for Windows.")

