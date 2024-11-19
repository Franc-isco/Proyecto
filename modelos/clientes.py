class Cliente:
    def __init__(self, id_cliente = 0 , rut_cliente = '', correo_contacto = '', telefono_contacto = '', direccion_cliente = '', habilitado = True):
        self.id_cliente = id_cliente
        self.rut_cliente = rut_cliente
        self.correo_contacto = correo_contacto
        self.telefono_contacto = telefono_contacto
        self.direccion_cliente = direccion_cliente
        self.habilitado = habilitado