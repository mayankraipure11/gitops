import os
import requests

def createUrlFromEnv():
    base_url = os.getenv("BASE_URL")
    protocol = os.getenv("PROTOCOL")
    port = os.getenv("PORT")

    try:
        if base_url and protocol and port:
            full_url = f"{protocol}://{base_url}:{port}"
            print("full url:::> ",full_url)
            return full_url
    except Exception as e:
        print("Missing protocol:::> ",protocol)
        print("base url:::> ",base_url)
        print("port:::> ",port)
        return str(e)  
    
def callHttpRequest(url: str):
    try:
        response = requests.get(url)
        return response.json()
    except Exception as e:
        return str(e)
    
def callExternalService(msg: str):
    print("callExternalService ==>",msg)
    url = createUrlFromEnv()
    if url:
        full_url = f"{url}/message?msg={msg}"
        response = callHttpRequest(full_url)
        return response
    return "Environment variables not set properly"