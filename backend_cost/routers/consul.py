from fastapi import APIRouter
from db.db import allSelectItems


router = APIRouter()


@router.get("/api/app_cost")
async def consult_item():
    allitems = await allSelectItems()  

    if(allitems.__sizeof__ == 0):
        return {"not is items"}
    
    clone = allitems.copy()
     
    response = []   
    for item in clone:
        response.append({"product": item[0], "cost": float(item[1])}) 

    return {"item": response}
