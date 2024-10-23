import tipo_empleados
import rol

class empleados(tipo_empleados, rol):
    def __init__(self, id_empleados, nombre_empleados, direccion_empleados, telefono_empleados, correo_empleados, f_inicio_contrato, salario_empleados, rut, contraseña, fecha_nacimiento, id_tipo, id_rol):
        tipo_empleados.__init__(id_tipo)
        rol.__init__(id_rol)
        self.id_empleados = id_empleados
        self.nombre_empleados = nombre_empleados
        self.direccion_empleados = direccion_empleados
        self.telefono_empleados = telefono_empleados
        self.correo_empleados = correo_empleados
        self.f_inicio_contrato = f_inicio_contrato
        self.salario_empleados = salario_empleados
        self.rut = rut
        self.contraseña = contraseña
        self.fecha_nacimiento = fecha_nacimiento

    def validar_datos():
        return
    
    def encriptar():
        return
    
    def descriptar():
        return
    
    def registrar():
        return
    
    def asignar_departamento():
        return
    
    def asignar_proyecto():
        return
    
    def registrar_tiempo():
        return
    