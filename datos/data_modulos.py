import datos.db as conexion

def listado_modulos():
    consulta = """
        SELECT 
            M.id_modulo AS 'ID Módulo',
            M.codigo_modulo AS 'Código Módulo',
            M.nombre_modulo AS 'Nombre Módulo',
            M.descripcion_modulo AS 'Descripción Módulo'
        FROM modulos M
        WHERE M.habilitado = 1;
    """
    data = conexion.leer_datos(consulta)
    return data

def buscar_modulo(busqueda):
    consulta = f"""
        SELECT 
            M.id_modulo AS 'ID Módulo',
            M.codigo_modulo AS 'Código Módulo',
            M.nombre_modulo AS 'Nombre Módulo',
            M.descripcion_modulo AS 'Descripción Módulo'
        FROM modulos M
        WHERE M.codigo_modulo = '{busqueda}';
    """
    data = conexion.leer_datos(consulta)   
    return data

