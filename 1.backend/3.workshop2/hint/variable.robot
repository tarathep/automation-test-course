*** Variables ***
${API_URL}    http://localhost:8080
${PARAMS}    /members


${ผลลัพธ์ที่คาดหวัง Hello Backend System}    Hello Member System

${ข้อมูลทดสอบ ลงชื่อเข้าใช้ระบบ Member Backend}    {"password": "password1", "username": "j.marry@mail.com"}
${ผลลัพธ์ที่คาดหวัง ลงชื่อเข้าใช้ระบบ Member Backend}    {"id": "10001", "name": "Marry", "role": "Admin"}

${ผลลัพธ์ที่คาดหวัง เรียก members ทั้งหมด}    {"members": [{"id": "10001", "firstName": "Marry", "lastName": "Jane", "role": "Admin", "email": "j.marry@mail.com", "password": "password1"}, {"id": "10002", "firstName": "Tommy", "lastName": "Miller", "role": "Developer", "email": "t.miller@mail.com", "password": "password2"}]}

${ข้อมูลทดสอบ เพิ่ม member}    {"id": "10003", "firstName": "Poppy", "lastName": "Bary", "role": "Admin", "email": "b.poppy@mail.com", "password": "password"}
${ผลลัพธ์ที่คาดหวัง เพิ่ม member}    {"id": "10003", "status": "added", "message": "success"}

${ข้อมูลทดสอบ เรียก member ด้วย id}    10003
${ผลลัพธ์ที่คาดหวัง เรียก member ด้วย id}    {"members": {"id": "10003", "firstName": "Poppy", "lastName": "Bary", "role": "Admin", "email": "b.poppy@mail.com", "password": "password"}}

${ข้อมูลทดสอบ แก้ไข member}    {"id": "10003", "firstName": "Poppy", "lastName": "Bary", "role": "Tester", "email": "b.poppy@mail.com", "password": "password"}
${ผลลัพธ์ที่คาดหวัง แก้ไข member}    {"id": "10003", "status": "updated", "message": "success"}

${ข้อมูลทดสอบ ลบ member ด้วย id}    10003
${ผลลัพธ์ที่คาดหวัง ลบ member ด้วย id}    {"id": "10003", "status": "delete", "message": "success"}

${ผลลัพธ์ที่คาดหวัง เพิ่ม member ซ้ำ}    {"id": "10003", "status": "add", "message": "duplicate id"}