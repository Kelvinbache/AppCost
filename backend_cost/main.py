import uvicorn
from fastapi import FastAPI
from routers import consul, add_product_cost


app=FastAPI()

app.include_router(consul.router)
app.include_router(add_product_cost.router)



# Cosas que necesito para hacer el backend:
# Modelo de respuesta y recoleccion
# conexion con la base de datos y peticion
# nombrar la version de la base de datos
# conexion con la aplicacion movil
# Agregar el .env y hacer la conexion con el config