from asyncio import tasks
from http.client import HTTPException
from fastapi import FastAPI

app = FastAPI()

@app.get("/tasks")
def read_tasks():
    return [{"task": "Learn Docker"}, {"task": "Build a project"}]

@app.post("/tasks")
def create_task(task: str):
    return {"task": task, "status": "created"}

@app.delete("/tasks/{task_name}")
def delete_task(task_name: str):
    for t in tasks:
        if t["task"].lower() == task_name.lower():
            tasks.remove(t)
            return {"task": task_name, "status": "deleted"}
    raise HTTPException(status_code=404, detail="Task not found")
