from typing import Optional
from fastapi import FastAPI
import os

app = FastAPI()

DEPS_FILE = '/deps/file.txt'

def get_deps():
    if os.path.exists(DEPS_FILE):
        with open(DEPS_FILE, 'r') as f:
            content = f.read().splitlines()
            return content
    return None

@app.get("/")
def read_root():
    content = get_deps()
    return {"Hello": "World", "content": content}

@app.get("/items/{item_id}")
def read_item(item_id: int, q: Optional[str] = None):
    return {"item_id": item_id, "q": q}
