from fastapi import APIRouter, HTTPException
from model.product_cost import Product
from db.db import insertTable


router = APIRouter()

@router.post("/api/app_cost")
async def add_product(items:Product):
     
   if (items.product.split() == " " or items.cost.split() == " "):
         raise HTTPException(status_code=404, detail="data not accepted")
   else:
    
     try:        
        await insertTable(items.product, float(items.cost))
        return {"datos enviados con exito"}
    
     except Exception as ex: 
            raise HTTPException(status_code=404, detail=ex)
     
