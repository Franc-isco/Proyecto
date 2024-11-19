from modelos.usuario import Usuario as usuario
from negocio.encriptacion import encriptar_contrasena as encriptar, desencriptar_contrasena as desencriptar
import datos.data_usuario

def buscar_usuario(busqueda):
    data = datos.data_usuarios.buscar_usuario(busqueda)
    if not data:
        print("No se encontraron usuarios.")
        return None

    usuario_login = usuario()
    for registro in data:
        usuario_login.rut = registro[0]
        usuario_login.correo_empleado = registro[1]
        usuario_login.contrasena_empleado = registro[2]
        usuario_login.permisos_rol = registro[3]
        
        # Desencriptar la contraseña
        contrasena_guardada = desencriptar(usuario_login.contrasena_empleado)
        print(f"Usuario encontrado: RUT: {usuario_login.rut}, Correo: {usuario_login.correo_empleado}, Permisos: {usuario_login.permisos_rol}")
        print(f"Contraseña desencriptada: {contrasena_guardada}")

    return usuario_login

def encriptacion_contrasena(contrasena):
    contrasena_encriptada = encriptar(contrasena)
    print(f"Contraseña encriptada: {contrasena_encriptada}")
    return contrasena_encriptada

def desencriptacion_contrasena(contrasena):
    resultado = desencriptar(contrasena)
    return resultado

# Ejemplo de uso
if __name__ == "__main__":
    busqueda = input("Ingrese el RUT o correo del usuario a buscar: ")
    buscar_usuario(busqueda)