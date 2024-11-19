from modelos.empleados import Empleado
from modelos.departamentos import Departamento

class DptosEmpleados(Empleado, Departamento):
    def __init__(self, id_dptos_empleados = 0, id_departamento = 0, id_empleado = 0, habilitado = True):
        super().__init__(id_empleado)
        super().__init__(id_departamento)
        self.id_dptos_empleados = id_dptos_empleados
        self.habilitado = habilitado
        

    