# list comprehension
user_input_numbers = str(input("Enter your numbers, seperated by comma: ")).split(",")
print(user_input_numbers)

user_numbers_as_int = []
for number in user_input_numbers:
    user_numbers_as_int.append(int(number))

print(user_numbers_as_int)

print([number for number in user_input_numbers])
print([number*2 for number in user_input_numbers])

print([int(number) for number in user_input_numbers])
print([int(number*2) for number in user_input_numbers])

print([number for number in user_numbers_as_int])
print([number*2 for number in user_numbers_as_int])