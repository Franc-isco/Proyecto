import empleados
import proyectos
import departamentos
import registro_tiempo

class informe(empleados.Empleado, proyectos.Proyecto, departamentos.Departamento, registro_tiempo.RegistroTiempo):
    def __init__(self, id_informe, nombre_informe, fecha_creacion, ubicacion, id_empleado, id_proyectos, id_departamento, id_registro):
        empleados.Empleado.__init__(self, id_empleado)
        proyectos.Proyecto.__init__(self, id_proyectos)
        departamentos.Departamento.__init__(self, id_departamento)
        registro_tiempo.RegistroTiempo.__init__(self, id_registro)
        self.id_informe = id_informe
        self.nombre_informe = nombre_informe
        self.fecha_creacion = fecha_creacion
        self.ubicacion = ubicacion

#importar con la base de datos      
    def generar_informe():
        return
    
    def exportar_informe():
        return
        