def create_student():
    user_name = input("Enter Student's Name: ")
    student_info = {'name': user_name,
                    'marks': []}
    return student_info

def add_mark(student, mark):
    student['marks'].append(mark)

def calculate_average_mark(student):
    number = len(student['marks'])
    if number == 0:
        return 0

    total = sum(student['marks'])
    return total/number

s = create_student()
print(calculate_average_mark(s))
add_mark(s, 5)
print(calculate_average_mark(s))
add_mark(s, 10)
print(calculate_average_mark(s))

