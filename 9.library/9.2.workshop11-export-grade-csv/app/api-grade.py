from bottle import Bottle, Route, run,response,request
import json

app = Bottle()

students=[
    {
        "id":"10001",
        "firstName":"Marry",
        "lastName":"Jane",
        "score":57
    },
    {
        "id":"10002",
        "firstName":"Tommy",
        "lastName":"Miller",
        "score":91
    },
    {
        "id":"10003",
        "firstName":"Jack",
        "lastName":"Jane",
        "score":67
    }
]

@app.route('/')
def heath():
    return 'API member Grade System'

@app.route('/students', method='GET')
def getStudent():
    response.content_type="application/json"
    
    return json.dumps(students)

if __name__ == '__main__':
    run(app, host='localhost', port=8081)