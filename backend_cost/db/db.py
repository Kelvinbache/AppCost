import psycopg
from config.config import config

#Delete table 
delete_table = "DROP TABLE product_cost CASCADE;"

#si tha exict
exitTable = "SELECT EXISTS ( SELECT 1 FROM pg_tables WHERE schemaname = 'public' AND pg_tables.tablename = 'product_cost');"


async def connectionDB():
    
    conn = None

    try:
        conn = psycopg.connect(
        dbname="appCost",
        host="localhost",
        user="postgres",
        password= config['passwordb'],
        port="5432"
        )
    
        print("connection is exit")    
        return conn
    
    except Exception as ex:
        print(f"ERROR CRÍTICO DE CONEXIÓN A DB: Verifica que PostgreSQL esté corriendo y las credenciales. {ex}")
        raise ex 


# Problem 
async def initDB():

   #table secundary
   table_add_product = "CREATE TABLE IF NOT EXISTS product_cost (id_product SERIAL PRIMARY KEY, product VARCHAR(50) NOT NULL, cost DECIMAL(8,3) NOT NULL);"

   # table principal
   table_add_product_month = "CREATE TABLE IF NOT EXISTS cost_month (id_month SERIAL PRIMARY KEY, month_record DATE NOT NULL, product_cost_id INT, FOREIGN KEY (product_cost_id) REFERENCES product_cost(id_product));"

   #Connection object
   conn = None

   try:
       conn = await connectionDB()
    
       if conn is None:
          raise Exception("Connection object is None after connectionDB.") 
   
       with conn.cursor() as cursor:
 
            cursor.execute(exitTable)  
            tableExict = cursor.fetchall()[0]

            if not tableExict: 
              cursor.execute(table_add_product)
              cursor.execute(table_add_product_month) 
            
            else:
               print("La table si exite")
               return 
               
       conn.commit()
       return conn
       #Here we return the connection object

   except Exception as ex:
        print(f"ERROR AL INICIALIZAR ESTRUCTURA DE TABLAS: {ex}") 
        raise ex 

   finally:
       if conn:
         conn.close()


async def insertTable(product:str, cost:float):

    insert_sql = "INSERT INTO product_cost (product, cost) VALUES (%s, %s);"
    
    conn = None

    try:
    
        conn = await connectionDB()
        
        with conn.cursor() as cursor:
            cursor.execute(insert_sql, (product, cost))
        
        conn.commit() 
    
    except Exception as ex:
        if conn:
            conn.rollback()
        print(f"error:{ex}")       
    
    finally:
         if conn:
          conn.close()

async def allSelectItems():
    conn = None
    selectAll = "SELECT * FROM product_cost"
    
    try:
       
       #Problem here
       conn = await connectionDB()    
       with conn.cursor() as cursor:
           data = cursor.execute(selectAll)
           return data.fetchall()

    except Exception as ex:
        print(f"error:{ex}")

    finally:
        if conn:
          conn.close()