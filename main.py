from DAL.db import generar_conexion
from DAL.consultas_sql import consulta_1, consulta_2

print("""
      Seleccione su Opción:
      1.- Consultar empleados
      2.- Consultar departamentos
      """)
accion = input('Ingresa su opción: ')


if accion == '1':
    generar_conexion('root', '', 'localhost', 'proyecto', consulta_1())
elif accion == '2':
    generar_conexion('root', '', 'localhost', 'proyecto', consulta_2())
else:
    print('Opción no válida. Saliendo del sistema...')