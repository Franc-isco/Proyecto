import proyecto_empleados
from datetime import datetime

class RegistroTiempo(proyecto_empleados.ProyectoEmpleados):
    def __init__(self, id_registro, fecha, descripcion_tareas, observacion, id_asociacion, cantidad_horas):
        proyecto_empleados.ProyectoEmpleados.__init__(self, id_asociacion)
        self.id_registro = id_registro
        self.fecha = fecha
        self.descripcion_tareas = descripcion_tareas
        self.observacion = observacion
        self.cantidad_horas = cantidad_horas
        
    def validar_cantidad_horas(self): #que sea un número y esté en el rango
        try:
            horas = float(self.cantidad_horas)
        except ValueError:
            return False, 'La cantidad de horas debe ser un número.'
        if horas < 0 or horas > 24:
            return False, 'La cantidad de horas debe estar entre 0 y 24.'
        return True, 'Cantidad de horas válida.'      
    
    def validar_fecha(self): #correcta y en buen formato
        try:
            fecha_dt = datetime.strptime(self.fecha, '%Y-%m-%d')
        except ValueError:
            return False, 'La fecha debe estar en formato YYYY-MM-DD.'
