from modelos.proyecto_empleados import ProyectoEmpleados
from datetime import datetime

class RegistroTiempo(ProyectoEmpleados):
    def __init__(self, id_registro_tiempo = 0, fecha_registro = '', tiempo_trabajado = 0, tareas_realizadas = '', observaciones = '', id_empleado_proyecto= 0, habilitado = True):
        super().__init__(id_empleado_proyecto)
        self.id_registro_tiempo = id_registro_tiempo
        self.fecha_registro = fecha_registro
        self.tiempo_trabajado = tiempo_trabajado
        self.tareas_realizadas = tareas_realizadas
        self.observaciones = observaciones
        self.habilitado = habilitado
        
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
