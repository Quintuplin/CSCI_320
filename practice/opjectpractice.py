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
    def __init__(self, r=0, i=0):
        self.real = r
        self.imag = i

    def getData(self):
        print("{0}+{1}j".format(self.real, self.imag))

# c1 = ComplexNumber(2,3)
# c1.getData()

# # create a new attribute dynamically
# c2 = ComplexNumber(5)
# c2.getData()
# c2.attr = 10

# print(c2.real, c2.imag, c2.attr)
# try:
#     c1.attr
# except Exception as e:
#     print('error', e)

# # deleting attributes
# c1 = ComplexNumber(2,3)
# del c1.imag
# try:
#     c1.getData()
# except Exception as e:
#     print('error', e)

# # deleting objects
# del c1
# try:
#     c1
# except Exception as e:
#     print('error', e)

# inheritance
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
        area = (s*(s-a)*(s-b)*(s-c)) ** 0.5
        print('The Area of the triangle is %0.2f' %area)

# testt = Triangle()
# testt.dispSides()
# testt.findArea()
# testt.inputSides()
# testt.dispSides()
# testt.findArea()

# print(isinstance(testt, Triangle))
# print(isinstance(testt, Poly))
# print(issubclass(Poly, Triangle))
# print(issubclass(Triangle, Poly))

# multiple inheritance
class B1:
    pass

class B2:
    pass

class Multi(B1, B2):
    "Absorbs both horizontally"
    pass

class Base:
    pass

class D1(Base):
    pass

class D2(D1):
    "Absorbs both verticalls"
    pass

# # note that nearly everything inherits from object in python
# print(issubclass(list,object))
# print(isinstance(5.5,object))
# print(isinstance("Hello",object))

# # method resolution order (MRO)
# # note: multi-classes are searched depth-first, left-right
# print(Multi.mro()) # equivalent to: print(Multi.__mro__)
# print(D2.mro())

# # more complex MRO
# class X: pass
# class Y: pass
# class Z: pass

# class A(X,Y): pass
# class B(Y,Z): pass

# class M(B,A,Z): pass

# # Output:
# # [<class '__main__.M'>, <class '__main__.B'>,
# # <class '__main__.A'>, <class '__main__.X'>,
# # <class '__main__.Y'>, <class '__main__.Z'>,
# # <class 'object'>]

# print(M.mro())

# Operator Overloading
class Point:
    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y

    # overload to make printable(/stringgable)
    def __str__(self):
        return "({0},{1})".format(self.x, self.y)

    # overload to make addable
    def __add__(self, other):
        x = self.x + other.x
        y = self.y + other.y

        return Point(x, y)

    def __lt__(self, other):
        self_mag = (self.x ** 2) + (self.y ** 2)
        other_mag = (other.x ** 2) + (other.y ** 2)
        return self_mag < other_mag

    def __eq__(self, other):
        return self.x == other.x and self.y == other.y

# p1 = Point(2,3)
# p3 = Point(2,3)
# p2 = Point(-1,2)

# # this works "pythonically" due to using the __str__ property
# print(p1)
# print(str(p1))
# print(format(p1))

# # uses __str__ and __add__
# print('add')
# print(p1+p2)

# # uses __str__ and __lt__
# print('less than')
# print(Point(1,1) < Point(-2,-3))
# print(p1 < p2)
# print(p2 < p1)

# # somehow also works for 'free'
# print('greater than')
# print (p1 > p2)
# print (p2 > p1)

# # uses __str__ and __eq__
# print('equal to')
# print(p1 == p2)
# print(p1 == p3)

# # note: p1 == p1 will always return true regardless

# # does not work, despite lt and eq: need to explicitly write le
# try:
#     print('less= than')
#     print (p1 <= p2)
#     print (p2 <= p1)
# except Exception as e:
#     print(e)

class pointle(Point):
    def __le__(self, other):
        return self.__lt__(other) or self.__eq__(other)

# p1 = pointle(2,3)
# p3 = pointle(2,3)
# p2 = pointle(-1,2)
# print('pointle less= than')
# print (p1 <= p2)
# print (p2 <= p1)
# print (p3 <= p1)

# # somehow also works for 'free'
# print('pointle greater= than')
# print (p1 >= p2)
# print (p2 >= p1)
# print (p3 >= p1)


# # Note: Operator Overloading Special Functions in Python
# Operator	Expression	Internally
# Addition	p1 + p2	p1.__add__(p2)
# Subtraction	p1 - p2	p1.__sub__(p2)
# Multiplication	p1 * p2	p1.__mul__(p2)
# Power	p1 ** p2	p1.__pow__(p2)
# Division	p1 / p2	p1.__truediv__(p2)
# Floor Division	p1 // p2	p1.__floordiv__(p2)
# Remainder (modulo)	p1 % p2	p1.__mod__(p2)
# Bitwise Left Shift	p1 << p2	p1.__lshift__(p2)
# Bitwise Right Shift	p1 >> p2	p1.__rshift__(p2)
# Bitwise AND	p1 & p2	p1.__and__(p2)
# Bitwise OR	p1 | p2	p1.__or__(p2)
# Bitwise XOR	p1 ^ p2	p1.__xor__(p2)
# Bitwise NOT	~p1	p1.__invert__()

# Comparision Operator Overloading in Python
# Operator	Expression	Internally
# Less than	p1 < p2	p1.__lt__(p2)
# Less than or equal to	p1 <= p2	p1.__le__(p2)
# Equal to p1 == p2	p1.__eq__(p2)
# Not equal to	p1 != p2	p1.__ne__(p2)
# Greater than	p1 > p2	p1.__gt__(p2)
# Greater than or equal to	p1 >= p2	p1.__ge__(p2)