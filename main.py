# print("Hi")

# #from flask import Flask, request
# import requests
# import azure.functions as func
# import logging
# #from APIFunctions import *

# app = func.FunctionApp()

# #url = "http://localhost:7071/api/DevConsoleMainTrigger"

# # @app.route('/submit_data', methods=['POST'])
# # def submit_data():
# #     data = request.json
# #     print("Data received:", data)
# #     # Process the data
# #     return 'Data received successfully'

# @app.route('/DevConsoleFunction1')
# def send_get_request_to_backend():
#     url = "http://localhost:7071/api/DevConsoleFunction1"

#     response = requests.get(url)
#     print(response.text)

#     if response.status_code == 200:
#         return 'GET request sent successfully to backend'
#     else:
#         return 'Failed to send GET request to backend'

# @app.route('/http_trigger1')
# def send_get_request_to_backend_2():
#     url = "https://devconsolefunction1.azurewebsites.net/api/http_trigger1?"
    
#     response = requests.get(url)
#     print(response.text)

#     if response.status_code == 200:
#         return 'GET request sent successfully to backend'
#     else:
#         return 'Failed to send GET request to backend'

# @app.route('/searchUser')
# def send_get_request_to_backend_3():
#     url = "https://lochsafety.com"
#     response = requests.get(url, params = {"user": "Thomas"})
#     print(response.text)

#     if response.status_code == 200:
#         return 'GET request sent successfully to backend'
#     else:
#         return 'Failed to send GET request to backend'


# #send_get_request_to_backend()
# #send_get_request_to_backend_2()
# #send_get_request_to_backend_3()

# #app = func.FunctionApp()

# # @app.function_name(name="http_trigger1")
# # @app.route(route="hello", auth_level=func.AuthLevel.ANONYMOUS)
# # def test_function(req: func.HttpRequest) -> func.HttpResponse:
# #     logging.info('Python HTTP trigger function processed a request.')
# #     return func.HttpResponse(
# #         "This HTTP triggered function executed successfully.",
# #         status_code=200
# #         )

# print(send_get_request_to_backend())
# #print(send_get_request_to_backend_2())

# # from pymongo.mongo_client import MongoClient
# # from pymongo.server_api import ServerApi

# #print(pullProfiles())

# # if __name__ == '__main__':
# #     app.run(debug=True)

import requests

url = 'http://localhost:7071/api/DevConsoleFunction1'
#url = 'https://devconsolefunction.azurewebsites.net/api/DevConsoleFunction1?'

mode = {'mode': 'findUser', 'args': {'User': "Aaryan", 'Action': "Ban", "Reason": "Being a bad boy"}}

response = requests.post(url, json=mode)

if response.status_code == 200:
    print('Function executed successfully!')
    print(response.content)
else:
    print(f'Error: {response.status_code} - {response.text}')