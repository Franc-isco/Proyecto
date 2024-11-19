import datos.db as conexion

def listado_empleados():
    consulta = """
        SELECT 
            E.id_empleado AS 'ID Empleado',
            E.rut AS 'RUT',
            E.nombre_empleado AS 'Nombre',
            DATE_FORMAT(E.fecha_inicio_contrato, '%d/%m/%Y') AS 'Fecha de Contrato',
            CONCAT('$', FORMAT(E.salario_empleado, 2)) AS 'Salario',
            E.correo_empleado AS 'Correo',
            E.telefono_empleado AS 'Teléfono',
            DATE_FORMAT(E.fecha_nacimiento, '%d/%m/%Y') AS 'Fecha de Nacimiento',
            TE.id_tipo_empleado AS 'ID Tipo Empleado',
            TE.nombre_tipo AS 'Tipo de Empleado',
            R.id_rol AS 'ID Rol',
            R.nombre_rol AS 'Rol'
        FROM empleados E
        JOIN tipos_empleados TE ON E.id_tipo_empleado = TE.id_tipo_empleado
        JOIN roles R ON E.id_rol = R.id_rol
        WHERE E.habilitado = 1;
    """
    data = conexion.leer_datos(consulta)
    return data

def buscar_empleado(busqueda):
    consulta = f"""
        SELECT 
            E.id_empleado AS 'ID Empleado',
            E.rut AS 'RUT',
            E.nombre_empleado AS 'Nombre',
            DATE_FORMAT(E.fecha_inicio_contrato, '%d/%m/%Y') AS 'Fecha de Contrato',
            CONCAT('$', FORMAT(E.salario_empleado, 2)) AS 'Salario',
            E.correo_empleado AS 'Correo',
            E.telefono_empleado AS 'Teléfono',
            DATE_FORMAT(E.fecha_nacimiento, '%d/%m/%Y') AS 'Fecha de Nacimiento',
            TE.id_tipo_empleado AS 'ID Tipo Empleado',
            TE.nombre_tipo AS 'Tipo de Empleado',
            R.id_rol AS 'ID Rol',
            R.nombre_rol AS 'Rol',
            IF(E.habilitado = 1, 'True', 'False') AS 'Habilitado'
        FROM empleados E
        JOIN tipos_empleados TE ON E.id_tipo_empleado = TE.id_tipo_empleado
        JOIN roles R ON E.id_rol = R.id_rol
        JOIN paises P ON E.codigo_pais = P.codigo_pais
        WHERE E.rut LIKE '%{busqueda}%'
            OR E.nombre_empleado LIKE '%{busqueda}%'
            OR E.correo_empleado LIKE '%{busqueda}%';
    """
    data = conexion.leer_datos(consulta)   
    return data