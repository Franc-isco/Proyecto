import empleados
import departamentos

class dptos_empleados(empleados, departamentos):
    def __init__(self, id_dptos_empleados, id_departamentos, id_empleados):
        empleados.__init__(id_empleados)
        departamentos.__init__(id_departamentos)
        self.id_dptos_empleados = id_dptos_empleados
        
    def validar_asignacion():
        return