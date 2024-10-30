def consulta_1():
    #Obtner informacion de empleados
    consulta1 = ("""
    SELECT 
        E.id_empleado AS 'ID',
        E.nombre_empleados AS 'Nombre',
        E.direccion_empleados AS 'Dirección',
        E.telefono_empleados AS 'Teléfono',
        E.correo_empleados AS 'Correo',
        E.f_inicio_contrato AS 'Fecha de Inicio de Contrato',
        E.salario_empleados AS 'Salario',
        E.rut AS 'RUT',
        E.fecha_nacimiento AS 'Fecha de Nacimiento',
        TE.tipo_empleados AS 'Tipo de Empleado',
        R.rol AS 'Rol'
    FROM empleados E
    JOIN tipo_empleados TE ON E.id_tipo = TE.id_tipo
    JOIN rol R ON E.id_rol = R.id_rol;
    """)
    return consulta1 