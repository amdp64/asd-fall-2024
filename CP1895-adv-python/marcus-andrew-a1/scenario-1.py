# Program to use inheritance to perform calculations
# on a rectangle or square. 

# Square class inherits Rectangle class. 
# two attributes : height/width of retangle. 
# two methods : to calculate perimeter & area

# Program should determine whether user
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
        # Top
        for x in range(self.width):
            print("* ", end="")
        print()
        # Sides
        for y in range(self.height-2):
            print("*" + ((self.width * 2 - 3) * " ") + "*")
        # Bottom
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
    print("Rectangle Calculator")
    choice = True
    while choice:
        shapeChoice = input("\nRectangle or square? (r/s): ")
        if (shapeChoice.lower() == "r"):
            height = int(input(f"{'Height:':<11}"))
            width = int(input(f"{'Width:':<11}"))
            rect = Rectangle(height, width)
            print(f"{'Perimeter:':<11}{rect.getPerimeter()}")
            print(f"{'Area:':<11}{rect.getArea()}")
            rect.plotShape()
        elif (shapeChoice.lower() == "s"):
            length = int(input(f"{'Length:':<11}"))
            sqr = Square(length)
            print(f"{'Perimeter:':<11}{sqr.getPerimeter()}")
            print(f"{'Area:':<11}{sqr.getArea()}")
            sqr.plotShape()
        choice = input("\nContinue? (y/n): ")
        if (choice.lower() == 'n'):
            choice = False
    print("\nBye!")

if __name__ == "__main__":
    main()

