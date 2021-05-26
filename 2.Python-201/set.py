#Sets in python
#adding number on a empty set
number = set()
number.add(3)
print(number)

#check intersection between two list
user_list = {3, 5, 7, 9}
user_re_def_list = {1, 5, 9, 13}
print(user_list.intersection(user_re_def_list))
print(user_re_def_list.intersection(user_list))