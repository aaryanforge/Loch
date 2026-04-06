import logging

import azure.functions as func
from pymongo.mongo_client import MongoClient
from pymongo.server_api import ServerApi

uri = "mongodb+srv://lochie:vLdQmlrVtSUVXCiP@cluster0.utwgb49.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
client = MongoClient(uri, server_api=ServerApi('1'))

db = client['Pilot-Jul24']

# Send a ping to confirm a successful connection
try:
    client.admin.command('ping')
    print("Pinged your deployment. You successfully connected to MongoDB!")
except Exception as e:
    print(e)


sampleEntry = {
    "Contraband": None,
    "TypeSeverity": None,
    "Period": None
    }

sampleReturn = {
    "Social Media": 0,
    "Bad Websites": 0,
    "Bad Videos": 0,
    "Other": 0
    }

def addContrabandEntry(args):
    username = args["Username"]

    usersDatabase = db["Userpool"]
    user = usersDatabase.find_one({"Username": username})

    if (user):
        contrabandTracking = user["ContrabandTracking"]["Month1"]

        newEntry = {
            "Contraband": "",
            "TypeSeverity": ""
        }

        contrabandTracking.append(newEntry)

        usersDatabase.update_one({"Username": username}, { "$set": {"ContrabandTracking.Month1" : contrabandTracking} })
    else:
        return "No user found"

addContrabandEntry({"Username": "G thang"})

def countUserInnocence(user):
    usersDatabase = db["Userpool"]
    filter = {"Username": {"$regex": "^" + user + "{1}", "$options": "i"}}
    users = usersDatabase.find(filter=filter)

    parent = None

    contrabandTracking = None
    # contrabandForCounting = None                   # to count number of months it has been and 

    for user in users:
        if (user["Parent Connected"] != ""):  # is it meant to be None? Or is there a diff identifier?
            parent = user["Parent Connected"]
            contrabandTracking = usersDatabase.find_one({"Username": user["Username"]})
            contrabandTracking = contrabandTracking["ContrabandTracking"]["Month1"]
            # contrabandForCounting = usersDatabase.find({"Username": user["Username"]}, {"contrabandTracking": 1})
            break

    # for m in contrabandForCounting:
    #     print(m)

    numberOfContrabands = 0

    recentMonthContrabandCounting = {
        "Contraband": None,
        "TypeSeverity": None
    }

    for c in contrabandTracking:
        print(c)
        numberOfContrabands += 1
    
    return numberOfContrabands

# countUserInnocence("G thang")

def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    name = req.params.get('name')
    if not name:
        try:
            req_body = req.get_json()
        except ValueError:
            pass
        else:
            name = req_body.get('name')

    if name:
        return func.HttpResponse(f"Hello, {name}. This HTTP triggered function executed successfully.")
    else:
        return func.HttpResponse(
             "This HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response.",
             status_code=200
        )
