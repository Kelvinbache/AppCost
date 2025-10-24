import os 
from dotenv import load_dotenv

load_dotenv()


config = {
   "url_database": os.getenv("UrlDatabase"),
}