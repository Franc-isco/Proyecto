import datos.db as conexion

def listado_tipos_empleado():
    consulta = """
        SELECT 
            TE.id_tipo_empleado AS 'ID Tipo Empleado',
            TE.nombre_tipo AS 'Tipo de Empleado',
            TE.detalle_tipo AS 'Descripción'
        FROM tipos_empleado TE
        WHERE TE.habilitado = 1;
    """
    data = conexion.leer_datos(consulta)
    return data

def buscar_tipo_empleado_por_id(id):
    consulta = f"""
        SELECT 
            TE.id_tipo_empleado AS 'ID Tipo Empleado',
            TE.nombre_tipo AS 'Tipo de Empleado',
            TE.detalle_tipo AS 'Descripción'
        FROM tipos_empleado TE
        WHERE TE.id_tipo_empleado = {id};
    """
    data = conexion.leer_datos(consulta)
    return data