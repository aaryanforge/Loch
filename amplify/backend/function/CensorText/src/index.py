import json

def handler(event, context):
    print('received event:')
    print(event)
  
    messageContent = event["queryStringParameters"]["message"]
    return {
        'statusCode': 200,
        'headers': {
            'Access-Control-Allow-Headers': '*',
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'OPTIONS,POST,GET'
        },
        'body': json.dumps(
            {
                "message": messageContent,
                "classification": classify_text(messageContent)
            }
        )
    }

def classify_text(text):
    if len(text) > 20:
        return "Oh no, your message has exceeded our 20 character limit!"
    return "Good, under 20 charcters."