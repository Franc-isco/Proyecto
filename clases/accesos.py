import rol
import modulos

class accesos(rol, modulos):
    def __init__(self, id_accesos, id_rol, cod_modulos):
        rol.__init__(id_rol)
        modulos.__init__(cod_modulos)
        self.id_accesos = id_accesos
        self.id_rol = id_rol
        self.cod_modulos = cod_modulos
        
    def definir_acceso():
        return