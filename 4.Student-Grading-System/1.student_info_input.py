def create_student():
    #ask user for the student's name
    user_name = input("Enter Student's Name: ")
    #create the dictionary in the format {'name': '<student_name>','marks':[]}
    user_list = []
    student_info = {'name': user_name,
                'marks': user_list}
    #return that dictionary
    return student_info

print(create_student())

