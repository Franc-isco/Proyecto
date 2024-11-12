from cryptography.fernet import Fernet
from auxiliares.clave import clave_guardada

def encriptar_contraseña(contraseña):
    clave = Fernet(clave_guardada)
    token = clave.encrypt(contraseña.encode('utf-8')) #convierte la contraseña en bytes 
    return token 

def desencriptar_contraseña(token):
    clave = Fernet(clave_guardada)
    contraseña_guardada = clave.decrypt(token)
    return contraseña_guardada #devuelve contraseña desencriptada en formato de bytes


