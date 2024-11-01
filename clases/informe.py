import empleados
import proyectos
import departamentos
import registro_tiempo
import DAL.db 
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
import pandas as pd

class Informe(empleados.Empleado, proyectos.Proyecto, departamentos.Departamento, registro_tiempo.RegistroTiempo):
    def __init__(self, id_informe, nombre_informe, fecha_creacion, ubicacion, id_empleado, id_proyectos, id_departamento, id_registro):
        empleados.Empleado.__init__(self, id_empleado)
        proyectos.Proyecto.__init__(self, id_proyectos)
        departamentos.Departamento.__init__(self, id_departamento)
        registro_tiempo.RegistroTiempo.__init__(self, id_registro)
        self.id_informe = id_informe
        self.nombre_informe = nombre_informe
        self.fecha_creacion = fecha_creacion
        self.ubicacion = ubicacion

    def generar_informe(self):
        conexion = DAL.dbdb.generar_conexion() 
        cursor = conexion.cursor()
        
        cursor.execute("SELECT * FROM informes WHERE id_informe = %s", (self.id_informe,))
        informe_data = cursor.fetchone()
        
        cursor.close()
        conexion.close()
        
        if informe_data:
            return {
                "id_informe": informe_data[0],
                "nombre_informe": informe_data[1],
                "fecha_creacion": informe_data[2],
                "ubicacion": informe_data[3],
            }
        else:
            print("Informe no encontrado.")
            return None

    def exportar_informe(self, formato='pdf'):
        informe_data = self.generar_informe()
        
        if informe_data is None:
            return
        
        if formato == 'pdf':
            self.exportar_a_pdf(informe_data)
        elif formato == 'excel':
            self.exportar_a_excel(informe_data)
        else:
            print("Formato no soportado.")

    def exportar_a_pdf(self, informe_data):
        pdf_file = f"{informe_data['nombre_informe']}.pdf"
        c = canvas.Canvas(pdf_file, pagesize=letter)
        c.drawString(100, 750, f"Informe ID: {informe_data['id_informe']}")
        c.drawString(100, 730, f"Nombre: {informe_data['nombre_informe']}")
        c.drawString(100, 710, f"Fecha de Creación: {informe_data['fecha_creacion']}")
        c.drawString(100, 690, f"Ubicación: {informe_data['ubicacion']}")
        c.save()
        print(f"Informe exportado a PDF: {pdf_file}")

    def exportar_a_excel(self, informe_data):
        df = pd.DataFrame([informe_data])
        excel_file = f"{informe_data['nombre_informe']}.xlsx"
        df.to_excel(excel_file, index=False)
        print(f"Informe exportado a Excel: {excel_file}")
        