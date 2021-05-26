#if-else in python
number = int(input("Enter a number: "))

if number in range(80, 101):
    print("A+")
elif number in range(50, 80):
    print("50 to 79 range")
elif number in range(33, 50):
    print("33 to 49 range")
elif number in range(101, 1000):
    print("Over 100")
else:
    print("Fail")
