from DAL.db import generar_conexion
from DAL.consultas_sql import consulta_1

print("""
      Seleccione su Opción:
      1.- Consultar empleados
      """)
accion = input('Ingresa su opción: ')


if accion == '1':
    generar_conexion('root', '', 'localhost', 'proyecto', consulta_1())
else:
    print('Opción no válida. Saliendo del sistema...')