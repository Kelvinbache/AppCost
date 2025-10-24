import uvicorn
from fastapi import FastAPI, HTTPException
from routers import consul, add_product_cost
from db.db import initDB

app=FastAPI()

@app.on_event("startup")
async def startup_event():
    try:
       init = await initDB()
       print("Database initialized at startup: " + str(init))
   
    except Exception as e:
        raise HTTPException(status_code=404, detail=f"Error during database initialization at startup: {e}")

app.include_router(consul.router)
app.include_router(add_product_cost.router)


# Cosas que necesito para hacer el backend:
# Modelo de respuesta y recoleccion
# conexion con la base de datos y peticion
# nombrar la version de la base de datos
# conexion con la aplicacion movil
# Agregar el .env y hacer la conexion con el config