def consulta_empleados():
    # Obtener información de empleados
    consulta1 = ("""
    SELECT 
        E.id_empleado AS 'ID',
        E.nombre_empleado AS 'Nombre',
        E.direccion_empleado AS 'Dirección',
        E.telefono_empleado AS 'Teléfono',
        E.correo_empleado AS 'Correo',
        E.fecha_inicio_contrato AS 'Fecha de Inicio de Contrato',
        E.salario_empleado AS 'Salario',
        E.rut AS 'RUT',
        E.fecha_nacimiento AS 'Fecha de Nacimiento',
        TE.id_tipo_empleado AS 'ID Tipo de Empleado',
        TE.nombre_tipo AS 'Tipo de Empleado',
        R.id_rol AS 'ID Rol',
        R.nombre_rol AS 'Rol'
    FROM empleados E
    JOIN tipos_empleados TE ON E.id_tipo_empleado = TE.id_tipo_empleado
    JOIN roles R ON E.id_rol = R.id_rol;
    """)
    return consulta1

def consulta_2():
    #Obtener información de departamentos. 
    consulta2 = ("""
    SELECT 
        D.id_departamento AS 'ID',
        D.nombre_departamentos AS 'Nombre',
        D.telefono_departamentos AS 'Teléfono'
    FROM departamentos D;
    """)
    return consulta2
