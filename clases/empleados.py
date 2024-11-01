import tipo_empleados
import rol
from rut_chile import rut_chile
import re
import bcrypt

class Empleado(tipo_empleados.TipoEmpleados, rol.Rol):
    def __init__(self, id_empleado, nombre_empleados, direccion_empleados, telefono_empleados, correo_empleados, f_inicio_contrato, salario_empleados, rut, contraseña, fecha_nacimiento, id_tipo, id_rol):
        tipo_empleados.TipoEmpleados.__init__(self, id_tipo)
        rol.Rol.__init__(self, id_rol)
        self.id_empleado = id_empleado
        self.nombre_empleados = nombre_empleados
        self.direccion_empleados = direccion_empleados
        self.telefono_empleados = telefono_empleados
        self.correo_empleados = correo_empleados
        self.f_inicio_contrato = f_inicio_contrato
        self.salario_empleados = salario_empleados
        self.rut = rut
        self.contraseña = self.encriptar(contraseña) #encriptar contraseña añ crear el objeto
        self.fecha_nacimiento = fecha_nacimiento

    def validar_rut(self):
        return rut_chile.is_valid_rut(self.rut)
    
    def validar_correo(self):
        regex = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,7}\b'
        if(re.fullmatch(regex, self.correo_empleados)):
            return True
        else:
            return False
    
    def encriptar(self, contraseña): #utiliza bcrypt. 
        return bcrypt.hashpw(contraseña.encode('utf-8'), bcrypt.gensalt())
    
    
    def verificar_contraseña(self, contraseña): #verifica la contraseña ingresada
        return bcrypt.checkpw(contraseña.encode('utf-8'), self.contraseña)
    
    