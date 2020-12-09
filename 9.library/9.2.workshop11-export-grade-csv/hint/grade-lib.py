import csv

def ExportCSV(filename,students):
    with open(filename+'.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(["ID", "FirstName", "LastName","Score","Grade"])
        for i,student in enumerate(students):
            writer.writerow([(i+1), student["firstName"], student["lastName"],student["score"],calGrade(student["score"])])

def calGrade(score):
    if score>79:
        return "A"
    elif score>69:
        return "B"
    elif score>59:
        return "C"
    elif score>49:
        return "D"
    return "F"
