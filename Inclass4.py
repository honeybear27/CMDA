#Inclass4 Part 2

"""What does the code below do? Run the code in iPython.
For each line of code, add an explanation
through a comment."""

#PART I

print "I will now count my chickens:"
""" print out "I will now count my chickens:" """
print "Hens", 25 + 30 / 6
print "Roosters", 100 - 25 * 3 % 4
""" print out "Hens" and "Roosters" and shows the result of calculations on the right"""

print "Now I will count the eggs:"
""" print out "Now I will count the eggs:" """

print 3 + 2 + 1 - 5 + 4 % 2 - 1 / 4 + 6
""" print out the result of calculation """
print "Is it true that 3 + 2 < 5 - 7?"
""" print out "Is it true that 3 + 2 < 5 - 7?" not the result of calculation """
print 3 + 2 < 5 - 7
""" print out true or false of the equation """

print "What is 3 + 2?", 3 + 2
print "What is 5 - 7?", 5 - 7
""" print out "What is 3 +2?" and "What is 5 - 7?" and shows the result of calculation on the right side"""

print "Oh, that's why it's False."
"""print out "Oh, that's why it's False." """
print "How about some more."
"""print out "How about some more." """
print "Is it greater?", 5 > -2
print "Is it greater or equal?", 5 >= -2
print "Is it less or equal?", 5 <= -2
""" print out "Is it greater?", "Is it greater or equal?", and "Is it less or equal?".
	On the right of the comments, print out true or false of the equations, which are 5 > -2,
	5 >= -2, and 5 <= -2 
"""

#PART II

days = "Mon Tue Wed Thu Fri Sat Sun"
months = "Jan\nFeb\nMar\nApr\nMay\nJun\nJul\nAug"
""" The new variable days and months are created and assigned "Mon Tue Wed Thu Fri Sat Sun" and
	"Jan\nFeb\nMar\nApr\nMay\nJun\nJul\nAug"
"""

print "Here are the days: ", days
print "Here are the months: ", months
""" print out "Here are the days: " and "Here are the months: "
	,and print out the value that is assigned to days and months variables.
"""
	
#PART III

the_count = [1, 2, 3, 4, 5]
fruits = ['apples', 'oranges', 'pears', 'apricots']
change = [1, 'pennies', 2, 'dimes', 3, 'quarters']
""" Assign the_count, fruits, and change variables to [1, 2, 3, 4, 5], ['apples', 'oranges' 'pears', 'apricots'],
	and [1, 'pennies', 2, 'dimes', 3, 'quarters']
"""
# 
for number in the_count:
    print "This is count %d" % number
""" print out the elements in the_count variable repeatedly,
	and each time print out "This is the count" on the left.
"""

# 
for fruit in fruits:
    print "A fruit of type: %s" % fruit
""" print out the elements in fruits variable repeatedly,
	and each time print out "A fruit of type:" on the left.
"""

	
# 
# Use %r format when you don't know
#if the elements are strings or integers
for i in change:
    print "I got %r" % i
""" print out the elements in change variable repeatedly,
	and each time print out "I got" on the left.
"""

# we can also build lists, first start with an empty one
elements = []

# then use the range function to do 0 to 5 counts
for i in range(0, 6):
    print "Adding %d to the list." % i
    # append is a function that lists understand
    elements.append(i)
""" print out "Adding # to the list." repeatedly, and put the number from 0 to 5 into #
"""

# 
for i in elements:
    print "Element was: %d" % i
""" print out "Element was:" repeatedly, and each time print out the elements of i varibale 
"""





#Inclass4 Part 3

"""What does the code below do? Run the code in iPython.
For each line of code, add an explanation
through a comment."""

#PART I
'''
#Use the code from Lecture14.py to create and change the 
#'stuff' list; Then comment on each line of the code below
#what it does, and what the result is
stuff = [1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print stuff[1]
print stuff[-1] 
print stuff.pop()
print ' '.join(stuff) 
print '#'.join(stuff[3:5]) 
'''
"""
print out 
print out 
print out how many elements in the stuff variable
print out 
print out
"""

#PART II

#Create comments where marked with # to explain the code below

# 
states = {
    'Oregon': 'OR',
    'Florida': 'FL',
    'California': 'CA',
    'New York': 'NY',
    'Michigan': 'MI'
}

# 
cities = {
    'CA': 'San Francisco',
    'MI': 'Detroit',
    'FL': 'Jacksonville'
}

# 
cities['NY'] = 'New York'
cities['OR'] = 'Portland'

# 
print '-' * 10
print "NY State has: ", cities['NY']
print "OR State has: ", cities['OR']
""" print out '-' 10 times for dividing into the space
	print out "NY State has:" and "OR State has:", and import the 'NY' and 'OR' 
	from the cities variable and print it out
"""

# 
print '-' * 10
print "Michigan's abbreviation is: ", states['Michigan']
print "Florida's abbreviation is: ", states['Florida']
""" print out '-' 10 times for dividing into the space
	print out "Michigan's abbrevation is:" and "Florida's abbreviation is:"
	,and import the 'Michigan' and 'Florida' from the states variable and print it out
"""

# 
print '-' * 10
print "Michigan has: ", cities[states['Michigan']]
print "Florida has: ", cities[states['Florida']]
""" print out '-' 10 times for dividing into the space
	print out "Michigan has:" and import 'Michigan' and 'Florida' from the states variable
	,and we got the 'MI' and 'FL'. And then, we import 'MI' and 'FL' from the cities variable
	,and print it out
"""

# 
print '-' * 10
for state, abbrev in states.items():
    print "%s is abbreviated %s" % (state, abbrev)
""" print out '-' 10 times for dividing into the space
	print out each states on the left and each abbreviation on the right repeatedly with comments "is abbreviated" 
"""

# 
print '-' * 10
for abbrev, city in cities.items():
    print "%s has the city %s" % (abbrev, city)
""" print out '-' 10 times for dividing into the space
	print out each states abbreviation on the left and the city on the right repeatedly
"""

# 
print '-' * 10
for state, abbrev in states.items():
    print "%s state is abbreviated %s and has city %s" % (
        state, abbrev, cities[abbrev])
""" print out '-' 10 times for dividing into the space
	print out each states name and abbreviations and city repeatedly
"""



