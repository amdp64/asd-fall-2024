# Application component
# Contains command logic
# Calls to the database

from scenario_5_data import *

def commandLogic():
    flag = True
    while (flag):
        command = input("\nCommand: ")
        if (command.lower() == 'exit'):
            flag = False
        elif (command.lower() == 'view'):
            viewPendingTasks()
        elif (command.lower() == 'history'):
            viewCompletedTasks()
        elif (command.lower() == 'add'):
            while True:
                newTask = input("Description: ")
                if (newTask != ''):
                    addTask(newTask)
                    break
        elif (command.lower() == 'complete'):
            while True:
                taskIDNumber = int(input("Number: "))
                maxNumber = getNumberPendingTasks()
                if (taskIDNumber > 0 and taskIDNumber <= maxNumber):
                    completeTask(taskIDNumber)
                    break
        elif (command.lower() == 'delete'):
            while True:
                taskName = input("Description: ")
                descriptions = getAllDescriptions()
                if (taskName in descriptions):
                    deleteTask(taskName)
                    break
    print("Bye!")
