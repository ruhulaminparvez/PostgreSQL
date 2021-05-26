def create_student():
    user_name = input("Enter Student's Name: ")
    student_info = {'name': user_name,
                    'marks': []}
    return student_info
s = create_student()

def add_mark(student, mark):
    student['marks'].append(mark)
    return None

add_mark(s, 5)
print(s)


