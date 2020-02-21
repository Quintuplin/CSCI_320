# https://www.programiz.com/python-programming/object-oriented-programming

# inits, functions, and public variables
class Parrot():
    species = 'Bird'

    def __init__(self, name, age):
        self.name = name
        self.age = age
        print("Bird is ready")

    def sing(self, song):
        return "{} sings {}".format(self.name, song)

    def dance(self):
        return "{} is now dancing.".format(self.name)

# blu = Parrot('Blue', 10)
# woo = Parrot('Woo', 15)

# print("Blu is a {}".format(blu.__class__.species))
# print("Woo is also a {}".format(woo.__class__.species))

# print("{} is {} years old".format(blu.name, blu.age))
# print("{} is {} years old".format(woo.name, woo.age))

# print(blu.sing("'Happy Birthday!'"))
# print(blu.dance())

# parent classes
class Bird:
    def __init__(self):
        print("Bird is ready")

    def whoisThis(self):
        print("Bird")

    def swim(self):
        print("Swim faster")

# inhertiance and chained init
class Penguin(Bird):
    def __init__(self):
        super().__init__()
        print("Penguin is ready")

    def whoisThis(self):
        print("Penguin")

    def run(self):
        print("Run faster")

# peggy = Penguin()
# peggy.whoisThis()
# peggy.swim()
# peggy.run()

# encapsulation (private variables)
class Computer:
    def __init__(self):
        self.__maxprice = 900

    def sell(self):
        print("Selling Price: {}".format(self.__maxprice))

    def setMaxPrice(self, price):
        self.__maxprice = price

# c = Computer()
# c.sell()

# c.__maxprice = 1000
# c.sell()

# c.setMaxPrice(1000)
# c.sell()

# polymorphism and interfaces
class Parrot(Bird): #auto uses defailt Bird init
    def fly(self):
        print('can fly')
    def swim(self):
        print("can't swim")

class Penguin:
    def __secrit(self): #private functions
        print("secritly can")

    def fly(self):
        print("can't fly")
        self.__secrit()

    def swim(self):
        print("can swim")

def fly_test(bird):
    bird.fly()

# blu = Parrot()
# peggy = Penguin()

# blu.whoisThis()

# fly_test(blu)
# fly_test(peggy)
# peggy.fly()

# docstrings
class StringClass:
    '''This is a docstring'''
    pass

# print(StringClass.__doc__)

class MyClass:
    "This is my second class"
    a = 10
    def func(self):
        print("Hello")

# print(MyClass.a)
# print(MyClass.func)
# print(MyClass.__doc__)

# ob = MyClass()
# print(ob.func)
# ob.func()

# constructors
class ComplexNumber:



class Poly:
    def __init__(self, num_sides):
        self.n = num_sides
        self.sides = [0 for i in range(num_sides)]

    def inputSides(self):
        self.sides = [float(input("Enter side "+str(i+1)+" : ")) for i in range(self.n)]

    def dispSides(self):
        for i in range(self.n):
            print("Side", i+1, "is", self.sides[i])

# testp = Poly(2)

# testp.dispSides()
# testp.inputSides()
# testp.dispSides()

class Triangle(Poly):
    def __init__(self):
        Poly.__init__(self, 3)
        super().__init__(3)

    def findArea(self):
        a, b, c = self.sides
        s = (a + b + c) / 2
        area = (s * (s-a) * (s-b) * (s-c) ** 0.5)
        print('The Area of the triangle is %0.2f' %area)

testt = Triangle()
# testt.dispSides()
# testt.findArea()
# testt.inputSides()
# testt.dispSides()
# testt.findArea()

# print(isinstance(testt, Triangle))
# print(isinstance(testt, Poly))
# print(issubclass(Poly, Triangle))
# print(issubclass(Triangle, Poly))