import rol
import modulos

class Accesos(rol.Rol, modulos.Modulo):
    def __init__(self, id_accesos, id_rol, cod_modulos):
        rol.Rol.__init__(self, id_rol)
        modulos.Modulo.__init__(self, cod_modulos)
        self.id_accesos = id_accesos
        self.id_rol = id_rol
        self.cod_modulos = cod_modulos
    
    #revisar y modificar luego de integrar la base de datos.
    def definir_acceso(self): #definir acceso basado en el rol y el módulo.
        #Definir el acceso.
        #Lista de roles y accesos permitidos
        accesos_permitidos = {
            1: ['mod1', 'mod2'], #Rol 1 tiene acceso a mod1 y mod2
            2: ['mod2', 'mod3'],
        }
        
        #Verificar si el rol tiene acceso al modulo
        if self.id_rol in accesos_permitidos:
            if self.cod_modulos in accesos_permitidos[self.id_rol]:
                return f"Acceso permitido para el rol {self.id_rol} al módulo {self.cod_modulos}."
            else:
                return f"Acceso denegado para el rol {self.id_rol} al módulo {self.cod_modulos}."
        else:
            return "Rol no encontrado."
