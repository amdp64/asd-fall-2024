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
        
def displayResult(ourList):
    print()
    print("Random Integers")
    print("=" * 15)
    print(f"{'Integers:':<11}{ourList}")
    print(f"{'Count:':<11}{ourList.getCount()}")
    print(f"{'Total:':<11}{ourList.getTotal()}")
    print(f"{'Average:':<11}{round(ourList.getAverage(),1)}")

def main():
    print("Random Integer List")
    userProvidedInt = int(input("\nHow many random integers should the list contain?: "))
    while True:
        while True:
            try:
                if (userProvidedInt > 0):
                    validatedInt = userProvidedInt
                    newIntList = RandomIntList(validatedInt)
                    break
                else:
                    print("Please enter a positive integer.")
                    userProvidedInt = int(input("\nHow many random integers should the list contain?: "))
            except ValueError:
                print("Please enter an integer.")
        displayResult(newIntList)
        choice = input("\nContinue? (y/n): ")
        if (choice.lower() == 'n'):
            print("\nBye!")
            break

if __name__ == "__main__":
    main()