from typing import Union
from fastapi import FastAPI
from .externalService import callExternalService

app = FastAPI()


@app.get("/ping")
def read_root():
    return {"id": 1, "message": "Welcome! to app-message-2"}



@app.get("/message")
def read_root(msg: str=None):
    if msg is None:
        return {"id": 1, "message": "Hello from app-message-2"}
    print("app-message-root ==>",msg)
    callExternal = callExternalService(msg)
    print("callExternal ==>",callExternal)
    message = callExternal.get('message')
    reverse_msg = reverse(message)
    print("app-message-2 ==>",reverse_msg)
    return {"id": 1, "message": reverse_msg}

def reverse(msg: str):
    i = 0
    j = len(msg) - 1
    while(i < j):
        msg = list(msg)
        msg[i], msg[j] = msg[j], msg[i]
        msg = ''.join(msg)
        i += 1
        j -= 1
    return msg

@app.get("/liveness")
async def liveness_probe():
    return {"status": "alive"}

@app.get("/readiness")
async def readiness_probe():
    return {"status": "ready"}

