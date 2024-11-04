from .db import generar_conexion
from clases.tipo_empleados import TipoEmpleados
from clases.rol import Rol
from clases.empleados import Empleado

def crear_empleado(user, password, server, database, empleado: Empleado):
    id_empleado = 0
    conexion = generar_conexion(user, password, server, database)
    
    sql_agregar_empleado = ("""
    INSERT INTO empleados 
    (id_empleado, nombre_empleados, direccion_empleados, telefono_empleados, 
    correo_empleados, f_inicio_contrato, salario_empleados, rut, 
    contraseña, fecha_nacimiento, id_tipo, id_rol) 
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    """)
    
    data_empleado = (
        empleado.id_empleado,
        empleado.nombre_empleados,
        empleado.direccion_empleados,
        empleado.telefono_empleados,
        empleado.correo_empleados,
        empleado.f_inicio_contrato,
        empleado.salario_empleados,
        empleado.rut,
        empleado.contraseña,
        empleado.fecha_nacimiento,
        empleado.id_tipo,
        empleado.id_rol
    )

    cursor = conexion.cursor()
    cursor.execute(sql_agregar_empleado, data_empleado)
    
    if cursor.rowcount > 0:
        id_empleado = cursor.lastrowid
        print(f"Empleado con ID: {id_empleado} agregado correctamente.")
    else:
        print("No ha sido posible agregar al empleado.")
    
    conexion.commit()                
    cursor.close()
    conexion.close()

    return id_empleado