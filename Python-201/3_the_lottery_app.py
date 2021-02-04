"""
The Lottery App I'm going to make: (Final Part)
---------------------------------------------------------------------------
    1. User can pick 6 numbers
    2. Lottery calculates 6 random numbers (between 1 to 20)
    3. Then we match the user numbers to the lottery numbers
    4. Calculate the winner based on how many numbers the  user matched
---------------------------------------------------------------------------
"""
import random

def menu():
    #ask player for numbers
    user_numbers = get_player_numbers()
    #calculate lottery numbers
    lottery_numbers = create_lottery_number()
    #print out the winnings
    matched_numbers = user_numbers.intersection(lottery_numbers)
    winning_price = 100 ** len(matched_numbers)
    print(f"Your matched numbers: {matched_numbers}.Congrates, You have Won ${winning_price}.")


#1. User can pick 6 numbers
def get_player_numbers():
    number_csv = input("Enter 6 numbers, seperated by comma: ")
    #Numbers of integer store the variable number_list
    number_list = number_csv.split(",")
    integer_list = {int(number) for number in number_list}
    return integer_list

#2. Lottery calculates 6 random numbers (between 1 to 20)
def create_lottery_number():
    values = set()
    while len(values) < 6:
        values.add(random.randint(1, 20))
    return values

menu()