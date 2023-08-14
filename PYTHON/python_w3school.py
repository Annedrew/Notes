# Multiline comment
"""This is a comment
written in
more than just one line"""

# Variable name convention
"""
1. Can't start with a number
2. Only letters, numbers, and underscores
3. Case-sensitive(区分大小写)
4. Cannot be a reserved word
"""

# Make the variable x belong to the global scope
"""In Python (and many other programming languages), the use of global variables is often discouraged, 
because they can introduce complexity and make code harder to understand, debug, and maintain"""
def myfunc():
    global x
    x = "fantastic"

# Convert x into a floating point number
x = 5
x = float(x)

# Convert x into a complex number
x = 5
x = complex(x)

# Get the first character of the string txt
txt = "Hello"
x = txt[0]

# Get the characters from index 2 to index 4
txt = "Hello"
x = txt[2:5]

# Return the string without any whitespace at the beginning or the end
txt = "Hello"
x = txt.strip()

# Convert the value of txt to upper case.
txt = "Hello"
txt = txt.upper()

# Add a placeholder for the age parameter
age = 36
txt = "My name is John, and I am {}"
print(txt.format(age))

# Check if "apple" is present in the "fruits" object
fruits = ["apple", "banana"]
if "apple" in fruits:
    print("Yes, apple is a fruit!")

# Add "lemon" as the second item in the fruits list
fruits = ["apple", "banana", "cherry"]
fruits.insert(1, "lemon")

# Remove "banana" from the fruits list
fruits.remove("banana")

# Remove "banana" from the fruits set
fruits.discard("banana")

# Use negative indexing to print the last item in the list
fruits = ["apple", "banana", "cherry"]
print(fruits[-1])

# Use the range of indexes to print the third, fourth, and fifth item in the list
fruits = ["apple", "banana", "cherry"]
print(fruits[2:5])

# Return False
print(bool(0))

# Add an element into a list
# Standard python list
my_list = [1,2,3]
my_list.append(4)
print(my_list)

# Using Numpy
import numpy as np
my_array = np.array([1, 2, 3])
my_array = np.append(my_array, 4)
print(my_array) 

# Use add method to add "orange" to the fruits set
fruits = ["apple", "banana", "cherry"]
fruits.add("orange")

# Add multiple items to the fruits set
fruits = {"apple", "banana", "cherry"}
more_fruits = ["orange", "mango", "grapes"]
fruits.upate(more_fruits)

# Print the value of the "model" key of the car dictionary
car = {
    "brand": "Ford",
    "model": "Mustang",
    "year": 1964
}
print(car.get("model"))

# Change the value from 1964 to 2020
car =	{
  "brand": "Ford",
  "model": "Mustang",
  "year": 1964
}
car["year"] = 2020

# Add the key/value pair "color" : "red" to the car dictionary.
car =	{
  "brand": "Ford",
  "model": "Mustang",
  "year": 1964
}
car["color"] = "red"

# Use the pop method to remove "model" from the car dictionary.
car =	{
  "brand": "Ford",
  "model": "Mustang",
  "year": 1964
}
car.pop("model")

# Use the clear method to empty the car dictionary.
car =	{
  "brand": "Ford",
  "model": "Mustang",
  "year": 1964
}
car.clear()

# Print "Hello" if a is equal to b, and c is equal to d.
if a == b and c == d:
  print("Hello")

# Use the correct short hand syntax to put the following statement on one line:
if 5 > 2: print("Five is greater than two!")

# Use the correct short hand syntax to write the following conditional expression in one line:
print("Yes") if 5 > 2 else print("No")

# Stop the loop if i is 3.
i = 1
while i < 6:
  if i == 3:
    break
  i += 1

# In the loop, when i is 3, jump directly to the next iteration.
i = 0
while i < 6:
  i += 1
  if i == 3:
    continue
  print(i)

# Print a message once the condition is false.
i = 1
while i < 6:
  print(i)
  i += 1
else:
  print("i is no longer less than 6")

# If you do not know the number of arguments that will be passed into your function, there is a prefix you can add in the function definition, which prefix?
def my_function(*kids):
  print("The youngest child is " + kids[2])

# If you do not know the number of keyword arguments that will be passed into your function, there is a prefix you can add in the function definition, which prefix?

# Create a lambda function that takes one parameter (a) and returns it.
x = lambda a : a

# Create an object of MyClass called p1
class MyClass:
  x = 5
p1 = MyClass()

# Use the p1 object to print the value of x:
class MyClass:
  x = 5
p1 = MyClass()
print(p1.x)

# What is the correct syntax to assign a "init" function to a class?
class Person:
  def __init__(self, name, age):
    self.name = name
    self.age = age

# What is the correct syntax to create a class named Student that will inherit properties and methods from a class named Person?
class Student(Person):

# We have used the Student class to create an object named x. What is the correct syntax to execute the printname method of the object x?
class Person:
  def __init__(self, fname):
    self.firstname = fname
  def printname(self):
    print(self.firstname)
class Student(Person):
  pass
x = Student("Mike")
x.printname()

# What is the correct syntax of printing all variables and function names of the "mymodule" module?
import mymodule
print(dir(mymodule))

# In Python, strings can be enclosed in either single quotes ('Hello') or double quotes ("Hello"), and they are functionally equivalent.

# Which method can be used to replace parts of a string?
string.replace(old_value, new_value, count)
# old_value: The string to search for.
# new_value: The string to replace the old value with.
# count: (Optional) A number specifying how many occurrences of the old value you want to replace. If you don't specify this, all occurrences will be replaced.

# In Python, <> was an old way to represent the "not equal to" operator. It's equivalent to !=.

# "List" allows duplicate members, "Set" not allow duplicate members