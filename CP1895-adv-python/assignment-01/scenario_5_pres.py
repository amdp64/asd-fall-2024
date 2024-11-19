# Presentation component
# Menu selection
# Calls to Application file

from scenario_5_app import commandLogic

def command():

    print("Task List\n")

    print("COMMAND MENU")
    print(f"{'view':<9}- View pending tasks")
    print(f"{'history':<9}- View completed tasks")
    print(f"{'add':<9}- Add a task")
    print(f"{'complete':<9}- Complete a task")
    print(f"{'delete':<9}- Delete a task")
    print(f"{'exit':<9}- Exit program")

def main():
    command()
    # Contained within Application file
    commandLogic()

if __name__ == "__main__":
    main()