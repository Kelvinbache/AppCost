import os 
from dotenv import dotenv_values

config = {
    passwordb = **dotenv_values(".env.PASSWORDB"),
    **os.environ
}