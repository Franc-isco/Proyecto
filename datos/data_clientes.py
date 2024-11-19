from db import generar_conexion as conexion

class DataEmpleados:
    def generar_cursor():
        cursor = conexion.cursor()
        return cursor
        
    def listado_empleados():
        cursor = DataEmpleados.generar_cursor()
        consulta = """
            SELECT 
                E.id_empleado AS 'Nº Empleado',
                E.nombre_empleado AS 'Nombre',
                E.direccion_empleado AS 'Dirección',
                E.telefono_empleado AS 'Teléfono',
                E.correo_empleado AS 'Correo',
                DATE_FORMAT(E.fecha_inicio_contrato, '%d/%m/%Y') AS 'Fecha Inicio Contrato',
                E.salario_empleado AS 'Salario',
                E.rut AS 'RUT',
                DATE_FORMAT(E.fecha_nacimiento, '%d/%m/%Y') AS 'Fecha Nacimiento',
                TE.id_tipo_empleado AS 'ID Tipo Empleado',
                TE.nombre_tipo AS 'Tipo de Empleado',
                R.id_rol AS 'ID Rol',
                R.nombre_rol AS 'Rol'
            FROM empleados E
            JOIN tipos_empleados TE ON E.id_tipo_empleado = TE.id_tipo_empleado
            JOIN roles R ON E.id_rol = R.id_rol;
        """
        
        cursor.execute(consulta)
        return cursor.fetchall()  # Retorna todos los resultados