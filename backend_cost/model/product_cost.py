from pydantic import BaseModel

# Model of cost and product
class Product(BaseModel):
    product:str
    cost:str
