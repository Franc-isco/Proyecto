import empleados
import proyectos
import departamentos
import registro_tiempo

class informe(empleados, proyectos, departamentos, registro_tiempo):
    def __init__(self, id_informe, nombre_informe, fecha_creacion, ubicacion, id_empleados, id_proyectos, id_departamentos, id_registro):
        empleados.__init__(id_empleados)
        proyectos.__init__(id_proyectos)
        departamentos.__init__(id_departamentos)
        registro_tiempo.__init__(id_registro)
        self.id_informe = id_informe
        self.nombre_informe = nombre_informe
        self.fecha_creacion = fecha_creacion
        self.ubicacion = ubicacion
        
    def generar_informe():
        return
    
    def exportar_informe():
        return
        