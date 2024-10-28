# Class that defines a custom exception.
class DataAccessError(Exception):
    pass

# Module that uses the DataAccessError class
from objects import DataAccessError

def read_movies():
    try:
        movies = []
        with open("movies.csv", newline="") as file:
            reader = csv.reader(file)
            for now in reader:
                movies.append(row)
        return movies
    except FileNotFoundError:
        raise DataAccessError("Data source not found.")
    except Exception:
        raise DataAccessError("Error accessing data source.")

# Handles a custom exception
from objects import DataAccessError

try:
    movies = db.read_movies()
except DataAccessError as e:
    print("DataAccessError:", e)