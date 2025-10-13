from fastapi import APIRouter
from model.product_cost import Product

router = APIRouter()

@router.post("/")
def add_product(product:Product):
    return product
