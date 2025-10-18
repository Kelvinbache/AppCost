from fastapi import APIRouter, HTTPException
from model.product_cost import Product
from db.db import connectionDB


router = APIRouter()

@router.post("/api/app_cost")
async def add_product(product:Product):

   if (product.product.split() == " " or product.cost.split() == " "):
         raise HTTPException(status_code=404, detail="data not accepted")
        
   else:
    
    try:
        # await connectionDB(product.product, product.cost)
        # return {"datos enviados con exito"}
        return {"data": product}
    
    
    except Exception as ex: 
           raise HTTPException(status_code=404, detail=ex)