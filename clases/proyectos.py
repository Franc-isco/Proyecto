from datetime import datetime

class Proyecto: 
    def __init__(self, id_proyectos, nombre_proyectos, descripcion_proyectos, fecha_inicio, fecha_fin):
        self.id_proyectos = id_proyectos
        self.nombre_proyectos = nombre_proyectos
        self.descripcion_proyectos = descripcion_proyectos
        self.fecha_inicio = fecha_inicio
        self.fecha_fin = fecha_fin
        
    def validar_fechas(self): #fecha inicio no sea posterior a fecha fin
        try:
            fecha_inicio_dt = datetime.strptime(self.fecha_inicio, '%Y-%m-%d')
            fecha_fin_dt = datetime.strptime(self.fecha_fin, '%Y-%m-%d')
        except ValueError:
            return False, 'Las fechas deben estar en formato YYYY-MM-DD.'
        if fecha_inicio_dt > fecha_fin_dt:
            return False, ' La fecha de inicio no puede ser posterior a la fecha de fin.'
        return True, 'Fechas válidas.'

#Implementar con la base de datos.
    def crear():
        return
    
    def editar():
        return
    
    def eliminar():
        return   