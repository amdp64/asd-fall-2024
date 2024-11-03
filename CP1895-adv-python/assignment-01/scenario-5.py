# Program that allows you to manage a task list stored in a database

import sqlite3

# Connect to the database
connection = sqlite3.connect('task_list_db.sqlite')
cursor = connection.cursor()

# view command
# Execute a SELECT statement to fetch all rows
cursor.execute('SELECT description FROM Task')
# Fetch all results from executed query
rows = cursor.fetchall()

for index, row in enumerate(rows, start=1):
    print(f"{index}. {row[0]}")
print()

# history command
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
print()

# Add - Add a task
new_task = "Get a dog"
# add new provided task to db
cursor.execute("INSERT INTO Task (description, completed) VALUES (?, ?)", (new_task, 0))
# Commit changes
connection.commit()

cursor.execute('SELECT description FROM Task')
# Fetch all results from executed query
rows = cursor.fetchall()

for index, row in enumerate(rows, start=1):
    print(f"{index}. {row[0]}")
print()

# Complete - complete a task
completed_task = 'Do homework'
cursor.execute("UPDATE Task SET completed = ? WHERE description = ?", (1, completed_task))
connection.commit()

# Delete - delete a task
task_to_delete = 'Get a dog'
cursor.execute("DELETE FROM Task WHERE description = ?", (task_to_delete,))
connection.commit()

# Close the connection
connection.close()


