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


