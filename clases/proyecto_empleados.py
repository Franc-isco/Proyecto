import proyectos
import empleados

class ProyectoEmpleados(proyectos.Proyecto, empleados.Empleado):
    def __init__(self, id_asociacion, id_proyectos, id_empleado):
        proyectos.Proyecto.__init__(self, id_proyectos)
        empleados.Empleado.__init__(self, id_empleado)
        self.id_asociacion = id_asociacion

#implementar con la base de datos
    def validar_asignacion():
        return
    
    