# Random Integer List
# Ask user for a number
# Generate random numbers in the quantity specified.

import random

class RandomIntList(list):
    def __init__(self, n):
        self.n = n # Number of random integers
        for i in range(n):
            rand_int = random.randint(1,100)
            self.append(rand_int)

    def getCount(self):
        return len(self)
    
    def getTotal(self):
        total = 0
        for i in range(len(self)):
            total += self[i]
        return total
    
    def getAverage(self):
        total = 0
        for i in range(len(self)):
            total += self[i]
        return total / len(self)
    
    def __str__(self):
        someString = ""
        for i in range(len(self)-1):
            someString += (str(self[i]) + ', ')
        someString += str(self[i]-1)
        return someString
        

#first_list = RandomIntList(12)
#second_list = RandomIntList(12)
#print(first_list)
#print(first_list.getCount())
#print(first_list.getTotal())
#print(first_list.getAverage())

def displayResult(ourList):
    print()
    print("Random Integers")
    print("=" * 15)
    print(f"Integers:\t{print(ourList)}")
    print(f"Count:\t\t{ourList.getCount()}")
    print(f"Total:\t\t{ourList.getTotal()}")
    print(f"Average:\t{round(ourList.getAverage(),1)}")

def main():
    print("Random Integer List")
    while True:
        while True:
            try:
                userProvidedInt = int(input("\nHow many random integers should the list contain?: "))
                if (userProvidedInt > 0):
                    validatedInt = userProvidedInt
                    newIntList = RandomIntList(validatedInt)
                    break
                else:
                    print("Please enter a positive integer.")
            except ValueError:
                print("Please enter an integer.")
        displayResult(newIntList)
        choice = input("\nContinue? (y/n): ")
        if (choice.lower() == 'n'):
            print("\nBye!")
            break

if __name__ == "__main__":
    main()