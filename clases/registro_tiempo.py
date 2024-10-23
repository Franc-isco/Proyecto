import proyecto_empleados

class registro_tiempo(proyecto_empleados):
    def __init__(self, id_registro, fecha, descripcion_tareas, observacion, id_asociacion):
        proyecto_empleados.__init__(id_asociacion)
        self.id_registro = id_registro
        self.fecha = fecha
        self.descripcion_tareas = descripcion_tareas
        self.observacion = observacion
        
    def validar_cantidad_horas():
        return
        