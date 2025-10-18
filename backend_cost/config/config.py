import os 
from dotenv import load_dotenv

load_dotenv()


config = {
    "passwordb":os.getenv("PASSWORDB"),
}