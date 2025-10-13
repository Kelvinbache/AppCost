import psycopg
from config.config import config

table_add_product = "CREATE TABLE product_cost (id_product INT PRIMARY KEY, product VARCHAR(50) NOT NULL, cost DECIMAL(8,3) NOT NULL)"


try:
    conn = psycopg.connect(
        dbname="appCost",
        host="localhost",
        user="postgres",
        password= config,
        port="5432"
    )
    
    print("connection is exit")

    cursor = conn.cursor()

    cursor.execute(table_add_product) 

except Exception as ex:
     print(ex)
