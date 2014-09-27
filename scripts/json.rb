require 'json'

parsed = JSON.parse('{"desc":{"someKey":"someValue","anotherKey":"value"},"main_item":{"stats":{"a":8,"b":12,"c":10}}}')

p parsed["desc"]["someKey"]
p parsed["main_item"]["stats"]["a"]


parsed1 = JSON.parse('{"desc":{"someKey":"someValue","anotherKey": ["v1","v2"]}}')
p parsed1["desc"]["anotherKey"]

parsed_file = JSON.parse(IO.read('C:\Documents and Settings\pradeep\Training\training_project\features\support\json_data.json'))
p parsed_file["desc"]
p parsed_file["main_item"]