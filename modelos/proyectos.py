from modelos.cliente import Cliente
from modelos.departamentos import Departamento
from datetime import datetime


class Proyecto (Cliente, Departamento): 
    def __init__(self, id_proyecto = 0, nombre_proyecto = '', descripcion_proyecto = '', fecha_inicio = '', fecha_fin = '', habilidato = True, id_departamento = 0, id_cliente = 0):
        super().__init__(id_cliente)
        super().__init__(id_departamento)
        self.id_proyecto = id_proyecto
        self.nombre_proyecto = nombre_proyecto
        self.descripcion_proyecto = descripcion_proyecto
        self.fecha_inicio = fecha_inicio
        self.fecha_fin = fecha_fin
        self.habilitado = habilidato


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