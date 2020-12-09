# จงสร้าง custom library 
ต่อจาก workshop 10 เรียกใช้ RequstsLibrary เพื่อ call ไปหา backend ทดสอบว่า call สำเร็จหรือไม่ จากนั้นนำข้อมูล student json ที่ได้ มาทำการ ตัดเกรด และ export ออกเป็น csv file
## Pre-requisites
- Api grade backend application is running
## Steps
- create python file lib “grade.py”
- create file name is workshop10.robot
- log_student.csv must be created by robot
- export report and document must be passed

## PYTHON CODE
```
import csv

def ExportCSV(filename,students):
    with open(filename+'.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(["ID", "FirstName", "LastName","Score","Grade"])
        for i,student in enumerate(students):
            writer.writerow([(i+1), student["firstName"], student["lastName"],student["score"],"call function grade"])
```

## ROBOT KEYWORD
```
Export CSV    log_student    ${result.json()}   #dict response json {}
```
