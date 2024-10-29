import os

# What is the current working directory
print(os.getcwd())
# This is path of current file
print(os.path.dirname(os.path.realpath(__file__)))

# Variable with value of our path
directory = os.path.dirname(os.path.realpath(__file__))
print(directory)

# This works accross Windows, Mac and Linux. Applies correct / or \.
file_path = os.path.join(directory, 'test4.txt')
print(file_path)

file = open(file_path, 'w')
file.write('hello from NEW FILE PATH')
file.close()

# Changing current working directory.
# new_directory = '/' # root
# os.chdir(new_directory)
# print(os.getcwd())

# File is in home directory.
with open('data.txt', 'r') as file:
    record = file.read()

# print(record)

# Wherever there is a '\n' we will divide the index.
record = record.split('\n')
#print(record)

with open('report.html', 'w') as report:
    report.write('<table>')
    for student in record:
        if 'small' in student:
            value = student.split(',') # now a list.
            result = '<tr>'
            for item in value: # for each item
                result += f'<td>{item}</td>'
            report.write(f'{result}</tr>')
    report.write('</table>')
