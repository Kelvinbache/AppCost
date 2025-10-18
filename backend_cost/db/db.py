import psycopg
from config.config import config

#table secundary
table_add_product = "CREATE TABLE product_cost (id_product SERIAL PRIMARY KEY, product VARCHAR(50) NOT NULL, cost DECIMAL(8,3) NOT NULL);"

# table principal
table_add_product_month = "CREATE TABLE cost_month (id_month SERIAL PRIMARY KEY, month_record DATE NOT NULL, product_cost_id INT, FOREIGN KEY (product_cost_id) REFERENCES product_cost(id_product));"

#insert date
insert_sql = "INSERT INTO product_cost (product, cost) VALUES (%s, %s);"

#Delete table 
delete_table = "DROP TABLE product_cost;"



async def connectionDB(product:str, cost:float):
    try:
        conn = psycopg.connect(
        dbname="appCost",
        host="localhost",
        user="postgres",
        password= config['passwordb'],
        port="5432"
        )
    
        print("connection is exit")

        cursor = conn.cursor()

        # cursor.execute(delete_table) 

        cursor.execute(table_add_product) 

        cursor.execute(insert_sql, (product, cost)) 

        cursor.execute("SELECT * FROM product_cost")
        print(cursor.fetchone()) 

    except Exception as ex:
           print(ex)
