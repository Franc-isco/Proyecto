from modelos.proyectos import Proyecto
from modelos.empleados import Empleado

class ProyectoEmpleados(Proyecto, Empleado):
    def __init__(self, id_empleado_proyecto = 0, id_proyecto = 0, id_empleado = 0, habilitado = True):
        super().__init__(id_proyecto)
        super().__init__(id_empleado)
        self.id_empleado_proyecto = id_empleado_proyecto
        self.habilitado = habilitado

    