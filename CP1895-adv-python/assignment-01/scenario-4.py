# Program that imports customer data from a CSV file
# into a database table.

# CSV and SQLITE files are provided.
# SQLite file should contain a table named Customer.

# Assuming that the Cutomer table should start at '1' and autoincrement. 

import sqlite3
import pandas as pd

# First, load data file.
dataFile = pd.read_csv('customers.csv')

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
connection = sqlite3.connect('customers.sqlite')
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

new_data.to_sql('Customer', connection, if_exists='append', index=False)

# Set starting index for customerID to start from 101
# cursor.execute("UPDATE sqlite_sequence SET seq = 100 WHERE name = 'Customer'")

# Commit changes and close the connection
connection.commit()
connection.close()

