import random

random_number = random.randint(0, 9)

magic_numbers = [random_number,random_number]
chances = 3

for attempt in range(chances): #range(chances) is a list that contained [0,1,2]
    print(f"This is attempt {attempt}.")
    user_input = int(input("Enter a number between 0 to 9: "))
    if user_input in magic_numbers:
        print("You Won!")
    else:
        print("You Lose!")