from fastapi import APIRouter

router = APIRouter()

@router.get("/")
def consult_item():
    return {"hello":"word"}
