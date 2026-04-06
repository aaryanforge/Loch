import logging

import azure.functions as func
from pymongo.mongo_client import MongoClient
from pymongo.server_api import ServerApi
import hashlib

uri = "mongodb+srv://lochie:vLdQmlrVtSUVXCiP@cluster0.utwgb49.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
client = MongoClient(uri, server_api=ServerApi('1'))

db = client['Pilot-Jul24']

# Send a ping to confirm a successful connection
try:
    client.admin.command('ping')
    print("Pinged your deployment. You successfully connected to MongoDB!")
except Exception as e:
    print(e)

# Pymongo Functions

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

def findUser(args):
    user = args["User"]

    users = db["ProfilesDatabase"]
    try:
        filter = {"Username": {"$regex": "^" + user + "{1}", "$options": "i"}}
        users = users.find(filter=filter)
        arr = []
        for document in users:
            arr.append(document)
        
        return str(arr)
    except:
        return "No users found."

def changeAccountStatus(args):
    try:
        user = args["User"]
        action = args["Action"]
        reason = args["Reason"]
    except:
        return "Not enough arguments"

    users = db["Userpool"]

    try:
        filter = {"Username": {"$regex": "^" + user + "{1}", "$options": "i"}}
        users = users.find(filter=filter)
        
        if not users[0]:
            return "No users found."

        if (action == "Ban"):
            db["Userpool"].update_one({"Username": user}, {"$set": {"AccountStatus": "Banned"}})
            
            banLog = db["BanLog"]
            banLog.insert_one({
                "User": user,
                "Reason": reason
            })

            return "Successfully banned " + user + "."
        elif (action == "Deactivate"):
            for document in users:
                document["AccountStatus"] = "Inactive"
            
            return "Successfully deactivated " + user + "."
        elif (action == "Reactivate"):
            for document in users:
                document["AccountStatus"] = "Active"
            
            return "Successfully activated " + user + "."
    except:
        return "No users found."

def updateAppStats():
    col = db["AppStats"]

    try:
        stats = col.find(filter={"Date": "TODAY"})

        if not stats:
            return "Request Failed"
    except:
        return "Request Failed"
    
    for stat in stats:
        stat.pop("_id")
        
        statName = list(stat)[0]

        # Total Accounts
        if (statName == "Total Accounts"):
            col1 = db["Userpool"]
            accounts = col1.find()
            numAccounts = 0

            for acc in accounts:
                numAccounts += 1
            
            col.update_one({ "Date": "TODAY" }, { "$set": {statName : numAccounts} })
        
def pullAppStats():
    col = db["AppStats"]

    updateAppStats()
    
    try:
        stats = col.find(filter={"Date": "TODAY"})

        if not stats:
            return "Request Failed"
    except:
        return "Request Failed"

    statsDict = {
        "Date": "TODAY",
        "Total Accounts": 0,
        "Current Online Accounts": 0,
        "Total Messages Sent Today": 0,
        "Total Sign Ins Today": 0,
        "Total Call Time Today": 0,
        "Total Number of Accounts Created Today": 0,
        "Signed In Users": {"None" : "None"},
    }

    for stat in stats:
        stat.pop("_id")

        for i in range (0, 6):
            statName = list(stat)[i]
            statsDict[statName] = stat[statName]

    return str(statsDict)

# authentication

def hash_pd(pd):
    data = pd.encode()
    hash = hashlib.sha256(data).hexdigest()

    return hash

def addAdminAcc(args):
    col = db["AdminUsers"]
    col.insert_one({"User": args["User"], "Password": hash_pd(args["Password"])})

def auth(args):
    try:
        col = db["AdminUsers"]
        item = col.find({"User": args["User"]})

        if (item):
            if (hash_pd(args["Password"]) == item[0]["Password"]):
                return "TRUE"
            else:
                return "FALSE"
        else:
            return "FALSE" 
    except:
        return "FALSE"

def manualAcceptFriend(user1, user2):
    col = db["ContactsDatabase"]

    filter1 = {"User1": {"$regex": "^" + user1 + "{1}", "$options": "i"}}
    contacts1 = col.find(filter=filter1)

    filter2 = {"User1": {"$regex": "^" + user2 + "{1}", "$options": "i"}}
    contacts2 = col.find(filter=filter2)

    for con in contacts1:
        if (con["User2"] == user2):
            if con["State"] == "P":
                col.update_one({ "User2": user2, "User1": user1, "State": "P" }, { "$set": {"State" : "C"} })

                return
    
    for con in contacts2:
        if (con["User2"] == user1):
            if con["State"] == "P":
                col.update_one({ "User1": user2, "User2": user1, "State": "P" }, { "$set": {"State" : "C"} })
                
                return

# Handler

def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    mode = req.params.get('mode')
    if not mode:
        try:
            req_body = req.get_json()
        except ValueError:
            pass
        else:
            mode = req_body.get('mode')

    if (mode == "pullProfiles"):
        return func.HttpResponse(pullProfiles())
    elif (mode == "pullUserInfo"):
        return func.HttpResponse(pullUserInfo())
    elif (mode == "findUser"):
        args = req.get_json().get('args')

        if args:
            return func.HttpResponse(findUser(args))
        else:
            return func.HttpResponse("No arguments provided")
    elif (mode == "changeAccountStatus"):
        args = req.get_json().get('args')

        if args:
            return func.HttpResponse(changeAccountStatus(args))
        else:
            return func.HttpResponse("No arguments provided")
    elif (mode == "pullAppStats"):
        return func.HttpResponse(pullAppStats())
    elif (mode == "authenticate"):
        args = req.get_json().get('args')

        if args:
            return func.HttpResponse(auth(args))
        else:
            return func.HttpResponse("FALSE")
    elif (mode == "manualAcceptFriend"):
        args = req.get_json().get('args')
        
        if args:
            return func.HttpResponse(manualAcceptFriend(args["User1"], args["User2"]))
        else:
            return func.HttpResponse("FALSE")
    else:
        return func.HttpResponse(
             status_code=200
        )
