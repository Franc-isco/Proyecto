from datos.db import generar_conexion
from datos.consultas_sql import consulta_1, consulta_2
from modelos.empleados import Empleado 
from datos.dbempleados import crear_empleado

print("""
      Seleccione su Opción:
      1.- Consultar empleados
      2.- Consultar departamentos
      3.- Crear empleado
      """)
accion = input('Ingresa su opción: ')


if accion == '1':
    generar_conexion('root', '', 'localhost', 'proyecto', consulta_1())
elif accion == '2':
    generar_conexion('root', '', 'localhost', 'proyecto', consulta_2())
elif accion == '3':
    #Datos del nuevo empleado
    id_empleado = int(input('Ingrese ID del emppleado: '))
    nombre = input('Ingrese el nombre del empleado; ')
    direccion = input("Ingrese la dirección del empleado: ")
    telefono = input("Ingrese el teléfono del empleado: ")
    correo = input("Ingrese el correo del empleado: ")
    f_inicio_contrato = input("Ingrese la fecha de inicio de contrato (YYYY-MM-DD): ")
    salario = float(input("Ingrese el salario del empleado: "))
    rut = input("Ingrese el RUT del empleado: ")
    contraseña = input("Ingrese la contraseña del empleado: ")
    fecha_nacimiento = input("Ingrese la fecha de nacimiento (YYYY-MM-DD): ")
    id_tipo = int(input("Ingrese el ID del tipo de empleado: "))
    id_rol = int(input("Ingrese el ID del rol del empleado: "))
    
    nuevo_empleado = Empleado(
        id_empleado, nombre, direccion, telefono, correo, f_inicio_contrato, salario, rut, contraseña, fecha_nacimiento, id_tipo, id_rol
    )
    
    crear_empleado('root', '', 'localhost', 'proyecto', nuevo_empleado)
else:
    print('Opción no válida. Saliendo del sistema...')