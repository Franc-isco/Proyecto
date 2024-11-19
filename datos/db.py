import mysql.connector
from mysql.connector import errorcode

def generar_conexion(user, password, server, database, consulta):
    config = {
        'user': user,
        'password': password,
        'host': server,
        'database': database
    }
    
    try: #establecer conexion
        conexion = mysql.connector.connect(**config)
        if conexion.is_connected():
            print('Conexión exitosa a la base de datos')
            cursor = conexion.cursor()
            cursor.execute(consulta)
            
            registros = cursor.fetchall() #verificar si se obtuvieron resultados
            if registros:
                for registro in registros:
                    print(registro)
            else:
                print('Su búsqueda no arrojó resultados...')
            
            cursor.close()
        else:
            print('No se pudo conectar a la base de datos')
    except mysql.connector.Error as error:
        #Manejo errores especificos
        if error.errno ==  errorcode.ER_ACCESS_DENIED_ERROR:
            print('Acceso denegado para el usuario o la contraseña.')
        elif error.errno == errorcode.ER_BAD_DB_ERROR:
            print('La base de datos no existe')
        else:
            print('Eroor:', error)
    finally:
        #Cerrar la conexión si está abierta
        if 'conexion' in locals() and conexion.is_connected():
            conexion.close()
            print('Conexión cerrada')
            