from modelos.empleados import Empleado
from modelos.roles import Rol
from modelos.modulos import Modulo

class Usuario(Empleado, Rol, Modulo):
    def __init__(self, id_usuario = 0, rut = '', correo_empleado = '', contrasena_empleado = '', permisos_rol = '', permisos = [Modulo]):
        super().__init__(rut, correo_empleado, contrasena_empleado)
        super().__init__(permisos_rol)
        self.id_usuario = id_usuario
        self.permisos = permisos