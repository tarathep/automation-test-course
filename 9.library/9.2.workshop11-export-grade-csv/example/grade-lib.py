import csv

def ExportCSV(filename,students):
    with open(filename+'.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(["ID", "FirstName", "LastName","Score","Grade"])
        for i,student in enumerate(students):
            writer.writerow([(i+1), student["firstName"], student["lastName"],student["score"],"call function grade"])
