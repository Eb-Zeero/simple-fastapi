from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware


origins = ['http://127.0.0.1:4200']
app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
async def root():
    return {"message": "Hello World"}
