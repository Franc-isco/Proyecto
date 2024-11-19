from modelos.empleados import Empleado
from modelos.roles import Rol
from modelos.modulos import Modulo

class Usuario(Empleado, Rol, Modulo):
    def __init__(self, id_usuario=0, rut='', correo_empleado='', contrasena_empleado='', permisos_rol='', permisos= None):
        if permisos is None:
            permisos = []
        Empleado.__init__(self, rut, correo_empleado, contrasena_empleado)
        Rol.__init__(self, permisos_rol)
        self.id_usuario = id_usuario
        self.permisos = permisos