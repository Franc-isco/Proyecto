class Rol:
    def __init__(self, id_rol, nombre_rol, permisos):
        self.id_rol = id_rol
        self.nombre_rol = nombre_rol
        self.permisos = permisos
    
    def asignar_permisos(self, permisos_nuevos):
        #nuevos permisos al rol
        if isinstance(permisos_nuevos, list):
            self.permisos.extend(permisos_nuevos) #agrega los nuevos permisos
            self.permisos = list(set(self.permisos)) #elimina duplicados
            return 'Permisos asignados con éxito.'
        else:
            return "Los permisos deben ser una lista."
    
    def gestionar_rol(self, nuevo_nombre_rol=None):
        #permite cambiar el nombre del rol
        if nuevo_nombre_rol:
            self.nombre_rol = nuevo_nombre_rol
            return f"Rol actualizado a: {self.nombre_rol}"
        return 'No se hicieron cambios en el rol.'
