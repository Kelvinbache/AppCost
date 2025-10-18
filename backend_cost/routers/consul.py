from fastapi import APIRouter

router = APIRouter()

@router.get("/api/app_cost")
def consult_item():
    return {"hello":"word"}
