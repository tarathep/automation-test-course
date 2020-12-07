from unittest.mock import Mock
from member import *

def test_web_index():
    assert hello() == "Hello Member System"

def test_web_members():
    assert getMember() == '''{"members": [{"id": "10001", "firstName": "Marry", "lastName": "Jane", "role": "Admin", "email": "j.marry@domain.com", "password": "P@ssw0rd"}, {"id": "10002", "firstName": "Somkiet", "lastName": "Poosungnern", "role": "Developer", "email": "p.somkiet@domain.com", "password": "P@ssw0rd"}]}'''


# POSITIVE
def test_web_member_by_id():
    assert getMemberById('10001') == '''{"members": {"id": "10001", "firstName": "Marry", "lastName": "Jane", "role": "Admin", "email": "j.marry@domain.com", "password": "P@ssw0rd"}}'''

# NAGATIVE
def test_web_member_by_id_error():
    assert getMemberById('')=='''{"id": null, "name": null, "role": null}'''