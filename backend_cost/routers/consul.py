from fastapi import APIRouter
from db.db import allSelectItems


router = APIRouter()


@router.get("/api/app_cost")
async def consult_item():
    allitems = await allSelectItems()  

    if(allitems.__sizeof__ == 0):
        return {"not is items"}
    
    return {"item": allitems}
