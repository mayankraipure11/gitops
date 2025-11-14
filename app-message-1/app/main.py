from typing import Union

from fastapi import FastAPI

app = FastAPI()


@app.get("/ping")
def read_root():
    return {"id": 1, "message": "Welcome! to app-message-1"}

@app.get("/message")
def read_root(msg: str = None):
    print("app-message-1 ==>",msg)
    if msg is None:
        return {"id": 1, "message": "Hello from app-message-1"}
    return {"id": 1, "message": msg}

@app.get("/liveness")
async def liveness_probe():
    return {"status": "alive"}

@app.get("/readiness")
async def readiness_probe():
    return {"status": "ready"}
