from fastapi import FastAPI

from fastapi.staticfiles import StaticFiles

api_app = FastAPI(title="api app")

@api_app.get("/demo")
async def demo():
    return {
        "message": "Hello World"
    }

app = FastAPI(title="main app")

app.mount("/api", api_app)
app.mount("/", StaticFiles(directory="ui", html=True), name="ui")