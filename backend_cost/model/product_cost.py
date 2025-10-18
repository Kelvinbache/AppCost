from pydantic import BaseModel, field_validator, ValidationError

# Model of cost and product
class Product(BaseModel):
    product:str
    cost:str
    
    # @field_validator('product', mode='after')
    # @classmethod
    # def validate(cls, value:str):
    #     if not value or value.split() == "":
    #         raise ValueError("Not is valid fields empty")
    #     return value
    

    # @field_validator('cost', mode='after')
    # @classmethod
    # def validate(cls, value:str):
    #     if value.split() == " ":
    #         raise ValueError("Not is valid field of cost, the value has to elderly that zero")   
    #     return value