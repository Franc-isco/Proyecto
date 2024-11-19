from modelos.tipo_empleados import TipoEmpleados
from modelos.rol import Rol 
from rut_chile import rut_chile
import re


class Empleado(TipoEmpleados, Rol):
    def __init__(self, id_empleado = 0, nombre_empleado = '', direccion_empleado = '', telefono_empleado = '', correo_empleado = '', f_inicio_contrato = '', salario_empleado = 0, rut = '', contrasena_empleado = '', fecha_nacimiento = '', id_tipo_empleado = 0, id_rol = 0, habilitado = True):
        super().__init__(id_tipo_empleado)
        super().__init__(id_rol)
        self.id_empleado = id_empleado
        self.nombre_empleado = nombre_empleado
        self.direccion_empleado = direccion_empleado
        self.telefono_empleado = telefono_empleado
        self.correo_empleado = correo_empleado
        self.f_inicio_contrato = f_inicio_contrato
        self.salario_empleado = salario_empleado
        self.rut = rut
        self.contrasena_empleado = contrasena_empleado
        self.fecha_nacimiento = fecha_nacimiento
        self.habilitado = habilitado

    def validar_rut(self):
        return rut_chile.is_valid_rut(self.rut)
    
    def validar_correo(self):
        regex = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,7}\b'
        if(re.fullmatch(regex, self.correo_empleados)):
            return True
        else:
            return False
    
    
    