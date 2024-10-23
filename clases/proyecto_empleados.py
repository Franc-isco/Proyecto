import proyectos
import empleados

class proyecto_empleados(proyectos, empleados):
    def __init__(self, id_asociacion, id_proyectos, id_empleados):
        proyectos.__init__(id_proyectos)
        empleados.__init__(id_empleados)
        self.id_asociacion = id_asociacion
    
    def validar_asignacion():
        return
    
    