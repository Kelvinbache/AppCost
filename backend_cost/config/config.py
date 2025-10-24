import os 
from dotenv import load_dotenv

load_dotenv()


config = {
    "passwordb":os.getenv("PASSWORDB"),
    "dbname": os.getenv("DBNAME"),
    "host": os.getenv("HOSTDB"),
    "user": os.getenv("USERDB"),
    "port": os.getenv("PORTDB")

}