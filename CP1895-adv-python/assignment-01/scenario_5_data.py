# Database Component
# Connects to the database and executes queries

import sqlite3

def getAllDescriptions():
    try:    
        connection = sqlite3.connect('task_list_db.sqlite')
        cursor = connection.cursor()

        query = f"SELECT description FROM Task"
        cursor.execute(query)

        # Extract all descriptions to a list for verification
        descriptions = [row[0] for row in cursor.fetchall()]

    except sqlite3.Error as e:
        print(f"An error has occurred: {e}")

    cursor = connection.cursor()
    return descriptions

def getNumberPendingTasks():
    try:
        connection = sqlite3.connect('task_list_db.sqlite')

        cursor = connection.cursor()

        # Select all rows and return count to variable.
        query = f"SELECT COUNT(*) FROM Task"
        cursor.execute(query)

        # Fetch the result (which is in first row)
        count = cursor.fetchone()[0]

    except sqlite3.Error as e:
        print(f"An error has occurred: {e}")
    
    connection.close()
    return count

def viewPendingTasks():
    try:
        connection = sqlite3.connect('task_list_db.sqlite')

        cursor = connection.cursor()
        # Execute a SELECT statement to fetch all rows
        cursor.execute('SELECT description FROM Task WHERE completed = 0')
        # Fetch all results from executed query
        rows = cursor.fetchall()
        
        for index, row in enumerate(rows, start=1):
            print(f"{index}. {row[0]}")

    except sqlite3.Error as e:
        print(f"An error has occurred: {e}")

    connection.close()

def viewCompletedTasks():
    try: 
        connection = sqlite3.connect('task_list_db.sqlite')
        cursor = connection.cursor()    

        # view completed tasks
        cursor.execute("""
            SELECT description
            FROM Task
            WHERE completed = 1
        """
        )
        # Fetch all results from executed query
        rows = cursor.fetchall()
        for index, row in enumerate(rows, start=1):
            print(f"{index}. {row[0]} (DONE!)")

    except sqlite3.Error as e:
        print(f"An error has occurred: {e}")
    
    connection.close()

def addTask(new_task):
    try:
        connection = sqlite3.connect('task_list_db.sqlite')
        cursor = connection.cursor()       
        
        # add new provided task to db
        cursor.execute("INSERT INTO Task (description, completed) VALUES (?, ?)", (new_task, 0))
        # Commit changes
        connection.commit()
    
    except sqlite3.Error as e:
        print(f"An error has occurred: {e}")

    connection.close()

def completeTask(taskIDNumber):
    try:
        connection = sqlite3.connect('task_list_db.sqlite')
        cursor = connection.cursor()       
        
        cursor.execute("""
            UPDATE Task
            SET completed = 1
            WHERE taskID = (
                SELECT taskID FROM Task
                WHERE completed = 0
                ORDER BY taskID
                LIMIT 1 OFFSET ?
            )
        """, (taskIDNumber-1,))
        connection.commit()
    
    except sqlite3.Error as e:
        print(f"An error has occurred: {e}")

    connection.close()

def deleteTask(taskName):
    try:
        connection = sqlite3.connect('task_list_db.sqlite')
        cursor = connection.cursor()      
        
        cursor.execute("DELETE FROM Task WHERE description = ?", (taskName,))
        connection.commit()

    except sqlite3.Error as e:
        print(f"An error has occurred: {e}")

    connection.close()