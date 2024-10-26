# Program to use inheritance to perform calculations
# on a rectangle or square. 

# Square class inherits Rectangle class. 
# two attributes : height/width of retangle. 
# two methods : to calculate perimeter & area

# Program should intelligently determine whether user
# wants to enter a rectangle or a square. 

# Assume user will enter valid data (no input checking)

class Rectangle:
    def __init__(self, height, width):
        self.height = height
        self.width = width

    def getPerimeter(self):
        perimeter = (self.height * 2) + (self.width * 2)
        return perimeter
    
    def getArea(self):
        area = self.height * self.width
        return area

    def plotShape(self):
        for x in range(self.width):
            print("* ", end="")
        print()

        for y in range(self.height-2):
            print("*" + ((self.width * 2 - 3) * " ") + "*")

        for x in range(self.width):
            print("* ", end="")
        print()
    
    def __str__(self):
        return f"This rectangle has a height of {self.height} and width of {self.width}."

class Square(Rectangle):
    def __init__(self, length):
        self.length = length
        super().__init__(length, length)

    def __str__(self):
        return f"This square has a length of {self.length}."

def main():
    print("Rectangle Calculator\n")
    choice = True
    while choice:
        shapeChoice = input("Rectangle or square? (r/s): ")
        if (shapeChoice.lower() == "r"):
            continue
            # Do rectangle stuff
        elif (shapeChoice.lower() == "s"):
            continue
            # Do square stuff
        


if __name__ == "__main__":
    main()


"""
r1 = Rectangle(3, 10)
print(r1)

print(r1.getPerimeter())
print(r1.getArea())
r1.plotShape()

print()
s1 = Square(5)
print(s1)
print(s1.getPerimeter())
print(s1.getArea())
s1.plotShape()
"""


"""
for x in range(s1.length):
    print("* ", end="")
print()

for y in range(s1.length-2):
    print("*" + ((s1.length * 2 - 3) * " ") + "*")

for x in range(s1.length):
    print("* ", end="")
print()
"""