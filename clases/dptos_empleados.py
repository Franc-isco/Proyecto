import empleados
import departamentos

class DptosEmpleados(empleados.Empleado, departamentos.Departamento):
    def __init__(self, id_dptos_empleados, id_departamento, id_empleado):
        empleados.Empleado.__init__(self, id_empleado)
        departamentos.Departamento.__init__(self, id_departamento)
        self.id_dptos_empleados = id_dptos_empleados
        
    def validar_asignacion(self): #validar la asignación del empleado al departamento.
        if not self.id_dptos_empleados: #comprobar si es None, vacio. 
            return False, "ID de asignación es inválido."
        if not self.id_empleado:
            return False, 'ID de empleado es inválido.'
        if not self.id_departamento:
            return False, 'ID de departamento es inválido.'
        return True, 'La asignación es válida.'
    