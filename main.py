from DAL.db import generar_conexion

if __name__ == '__main__':
    user = 'root'
    password = ''
    server = 'localhost'
    database = 'proyecto'
    consulta = 'SELECT * FROM empleados;'
    
    generar_conexion(user, password, server, database, consulta)