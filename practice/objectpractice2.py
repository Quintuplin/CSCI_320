# more practice from programiz

# underscores

# '_' denotes convention of 'please treat this as if it were private'
# '__' makes the attribute not publicly visible, but is still accessible by calling '_Classname__variableName'
# Python does not have 'true' private objects

# using properties implicitly
class Celsius:
    def __init__(self, temperature = 0):
        self.temperature = temperature

    def to_farenheit(self):
        return (self.temperature * 1.8) + 32

    def get_temperature(self):
        print("Getting value")
        return self.__temperature

    def set_temperature(self, value):
        if value < -273:
            raise ValueError("Temperature below -273 is not possible")
        print("Setting value")
        self.__temperature = value

    # @property
    # property attributes are, in order, 'getter', 'setter', 'deleter', 'doc'
    temperature = property(get_temperature, set_temperature, lambda x: None,'FDSA')

c = Celsius()

print(c.__doc__)
print(c.temperature)
# print(c.temperature.__doc__)
# print(c.temperature+1)
c.temperature = 10
print(c.temperature)
del(c.temperature)
print(c.temperature)


# using properties properly
# property attributes are, in order, 'getter', 'setter', 'deleter', 'doc'
class Celsius:
    "FDSA" # doc (implicitly)

    def __init__(self, temperature = 0):
        self._temperature = temperature

    def to_farenheit(self):
        return (self.temperature * 1.8) + 32

    @property
    def temperature(self):
        print("Getting value")
        return self._temperature

    @temperature.setter
    def temperature(self, value):
        if value < -273:
            raise ValueError('Temperature below -273 is not possible')
        print("Setting value")
        self._temperature = value

    @temperature.deleter
    def temperature(self):
        print("Deleting")
        self._temperature = None

c = Celsius()

# print(c.__doc__)
# print(c.temperature)
# # print(c.temperature+1)
# c.temperature = 10
# print(c.temperature)
# del(c.temperature)
# print(c.temperature)