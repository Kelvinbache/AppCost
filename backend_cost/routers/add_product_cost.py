from fastapi import APIRouter, HTTPException
from model.product_cost import Product
from db.db import connectionDB

router = APIRouter()

@router.post("/")
async def add_product(product:Product):
   
   if product:
      raise HTTPException(status_code=400, detail=str(product))
   
   else:
    
    try:
        await connectionDB(product.product, product.cost)
        return {"datos enviados con exito"}
    
    except Exception as ex: 
           raise HTTPException(status_code=404, detail=ex)