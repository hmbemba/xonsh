'''
Create descriptors here to validate args

class Integer:
    def __init__(self, name):
        self.name = name
        
    def __get__(self, obj, type=None):
        return obj.__dict__[self.name]
    
    def __set__(self, obj, value):
        if not isinstance(value, int):
            raise TypeError("Expected an int")
        if value < 0:
            raise ValueError("Expected a positive int")
        obj.__dict__[self.name] = value

class MyClass:
    attr = Integer("attr")

obj = MyClass()

# This will work because we are assigning an int
obj.attr = 10

# This will raise a TypeError because we are assigning a str
obj.attr = "foo"

# This will raise a ValueError because we are assigning a negative int
obj.attr = -10


'''