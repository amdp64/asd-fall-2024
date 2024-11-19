class Rectangle:
    def __init__(self, height, width):
        self.height = height
        self.width = width

    def getPerimeter(self):
        return 2 * (self.width + self.height)

    def getArea(self):
        return self.height * self.width

    def __str__(self):
        result = '* ' * self.width + '\n'

        for _ in range(self.height - 2):
            result += '*' + ' ' * (self.width * 2 - 3) + '*\n'

        result += '* ' * self.width
        return result


class Square(Rectangle):
    def __init__(self, side):
        super().__init__(side, side)

def main():
    print('Rectangle Calculator\n')
    while True:
        choice = input('Rectangle or square? (r/s): ').lower()
        if choice == 'r':
            height = int(input(f"{'Height:':<11}"))
            width = int(input(f"{'Width:':<11}"))
            r = Rectangle(height, width)
            
            print(f"{'Perimeter:':<11}{r.getPerimeter()}")
            print(f"{'Area:':<11}{r.getArea()}")
            print(r)
        elif choice == 's':
            side = int(input(f"{'Length:':<11}"))
            s = Square(side)
            
            print(f"{'Perimeter:':<11}{s.getPerimeter()}")
            print(f"{'Area:':<11}{s.getArea()}")
            print(s)
        else:
            print('Error: Invalid choice')

        repeat = input('\nContinue? (y/n): ')
        print()
        if repeat == 'n':
            break
    print('Bye!')

if __name__ == "__main__":
    main()