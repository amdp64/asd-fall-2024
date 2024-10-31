# Customer/Employee Data Entry

# Has a Person class that provides attributes for:
# first name, last name, and email.

# Has a Customer class that inherits Person, and adds:
# An attribute for a customer number

# Has an Employee class that inherits Person, and adds:
# An attribute for a social security number (SSN)

class Person:
    def __init__(self, first_name, last_name, email):
        self.first_name = first_name
        self.last_name = last_name
        self.email = email

    def getFullName(self):
        return self.first_name + " " + self.last_name

class Customer(Person):
    def __init__(self, first_name, last_name, email, customer_no):
        self.customer_no = customer_no
        super().__init__(first_name, last_name, email)

class Employee(Person):
    def __init__(self, first_name, last_name, email, ssn):
        self.ssn = ssn
        super().__init__(first_name, last_name, email)

newObject = None

def main():
    print("Customer/Employee Data Entry")
    while True:
        while True:
            choice = input("\nCustomer or employee (c/e): ")
            global newObject
            if (choice.lower() == 'c'):
                print("\nDATA ENTRY")
                fname = input("First name: ")
                lname = input("Last name: ")
                email = input("Email: ")
                cust_no = input("Number: ")
                # Create a new Customer object
                newObject = Customer(fname.capitalize(), lname.capitalize(), email, cust_no)
                break
            elif (choice.lower() == 'e'):
                print("\nDATA ENTRY")
                fname = input("First name: ")
                lname = input("Last name: ")
                email = input("Email: ")
                ssn = input("SSN: ")
                # Create a new Employee object
                newObject = Employee(fname.capitalize(), lname.capitalize(), email, ssn)
                break
            else:
                print("Unknown command. Please try again.")
        # Look at object created.
        # Display the data to the user.
        while True:
            if (isinstance(newObject, Customer)):
                print("\nCUSTOMER")
                print(f"Name:\t\t{newObject.getFullName()}")
                print(f"Email:\t\t{newObject.email}")
                print(f"Number:\t\t{newObject.customer_no}")
                break
            
            elif (isinstance(newObject, Employee)):
                print("\nEmployee")
                print(f"Name:\t\t{newObject.getFullName()}")
                print(f"Email:\t\t{newObject.email}")
                print(f"SSN:\t\t{newObject.ssn}")
                break

        choice = input("\nContinue? (y/n): ")
        if (choice.lower() == 'n'):
            break

    print("\nBye!")

if __name__ == "__main__":
    main()