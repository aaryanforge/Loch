from pymongo.mongo_client import MongoClient
from pymongo.server_api import ServerApi
# import json
# from flask import jsonify

uri = "mongodb+srv://aaryanpala05:VrylzW7J2HI8yBOE@testcluster.cpgxudx.mongodb.net/?retryWrites=true&w=majority&appName=TestCluster"
client = MongoClient(uri, server_api=ServerApi('1'))

db = client['TestDatabase']

# Send a ping to confirm a successful connection
try:
    client.admin.command('ping')
    print("Pinged your deployment. You successfully connected to MongoDB!")
except Exception as e:
    print(e)

def pullProfiles():
    profiles = db["ProfilesDatabase"]
    cursor = profiles.find({})
    arr = []
    for document in cursor:
        arr.append(document)
    
    return str(arr)

def pullUserInfo():
    users = db["Userpool"]
    cursor = users.find({})
    arr = []
    for document in cursor:
        arr.append(document)
    
    return str(arr)

def findUser(user):
    users = db["ProfilesDatabase"]
    try:
        filter = {"Username": {"$regex": "^" + user + "{1}"}}
        users = users.find(filter=filter)
        arr = []
        for document in users:
            arr.append(document)
        
        return str(arr)
    except:
        return "No users found."

