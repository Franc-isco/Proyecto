import datos.db as conexion

def listado_roles():
    consulta = """
        SELECT 
            R.id_rol AS 'ID Rol',
            R.nombre_rol AS 'Rol',
            R.descripcion_rol AS 'Descripción',
            R.permisos_rol AS 'Permisos'
        FROM roles R
        WHERE R.habilitado = 1;
    """
    data = conexion.leer_datos(consulta)
    return data

def buscar_rol_por_id(id):
    consulta = f"""
        SELECT 
            R.id_rol AS 'ID Rol',
            R.nombre_rol AS 'Rol',
            R.descripcion_rol AS 'Descripción',
            R.permisos_rol AS 'Permisos'
        FROM roles R
        WHERE R.id_rol = {id};
    """
    data = conexion.leer_datos(consulta)
    return data