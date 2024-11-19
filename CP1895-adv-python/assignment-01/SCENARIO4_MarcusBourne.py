# Program that imports customer data from a CSV file
# into a database table.

# CSV and SQLITE files are provided.
# SQLite file should contain a table named Customer.

# Assuming that the Cutomer table should start at '1' and autoincrement. 

import sqlite3
import pandas as pd

def dataImporter(csvFile, dbFile, tableName):

    # First, load data file
    dataFile = pd.read_csv(csvFile)

    # Create a new DataFrame with the renamed columns
    new_data = dataFile.rename(columns={
        'first_name': 'firstName',
        'last_name': 'lastName',
        'company_name': 'companyName',
        'address': 'address',
        'city': 'city',
        'state': 'state',
        'zip': 'zip'
    })[['firstName', 'lastName', 'companyName', 'address', 'city', 'state', 'zip']]

    # Connect to a SQLite database
    connection = sqlite3.connect(dbFile)
    cursor = connection.cursor()

    # Drop the table if it exists
    cursor.execute("DROP TABLE IF EXISTS Customer")

    # Create the customer table with an AUTOINCREMENT primary key
    cursor.execute("""
        CREATE TABLE Customer (
            customerID INTEGER PRIMARY KEY AUTOINCREMENT,
            firstName TEXT,
            lastName TEXT,
            companyName TEXT,
            address TEXT,
            city TEXT,
            state TEXT,
            zip TEXT
        )
    """)

    new_data.to_sql(tableName, connection, if_exists='append', index=False)

    # Set starting index for customerID to start from 101
    # cursor.execute("UPDATE sqlite_sequence SET seq = 100 WHERE name = 'Customer'")

    # Commit changes and close the connection
    connection.commit()
    connection.close()

def dbRowCount(dbFile, tableName):
    # Connect to a SQLite database
    connection = sqlite3.connect(dbFile)
    cursor = connection.cursor()

    # Select all rows and return count to variable.
    query = f"SELECT COUNT(*) FROM {tableName}"
    cursor.execute(query)

    # Fetch the result (which is in first row)
    count = cursor.fetchone()[0]
    connection.close()
    return count

def main():
    print("Customer Data Importer\n")
    csvFile = input(f"{'CSV file:':<12}")
    dbFile = input(f"{'DB file:':<12}")
    tableName = input(f"{'Table name:':<12}")
    try:
        dataImporter(csvFile, dbFile, tableName)
        # get row count.
        count = dbRowCount(dbFile, tableName)
        print()
        print(f"All old rows deleted from {tableName} table.")
        print(f"{str(count)} row(s) inserted into {tableName} table.")
    except FileNotFoundError:
        print("Error. One or more files not found.")
    except sqlite3.Error as e:
        print(f"Database error: {e}")
    except ValueError as e:
        print(f"Data error: {e}")

if __name__ == "__main__":
    main()