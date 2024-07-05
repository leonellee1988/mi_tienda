import tkinter as tk
from tkinter import messagebox
import mysql.connector
import ttkbootstrap as ttk
from ttkbootstrap.constants import *
from dotenv import load_dotenv
import os

# Función para limpiar los campos de entrada
def limpiar_campos():
    entrada_numero_factura.delete(0, tk.END)
    entrada_fecha_venta.delete(0, tk.END)
    entrada_codigo_producto.delete(0, tk.END)
    entrada_cantidad_venta.delete(0, tk.END)
    entrada_codigo_cliente.delete(0, tk.END)

# Función para insertar datos en la base de datos
def insertar_venta(numero_factura, fecha_venta, codigo_producto, cantidad_venta, codigo_cliente):

    # Aplicación de las variables de entorno
    load_dotenv()
    my_password = os.getenv("db_password")
    my_db = os.getenv("db_name")
    my_user = os.getenv("db_user")

    try:
        
        # Establecer conexión con la base de datos
        conexion = mysql.connector.connect(
            host='localhost',
            user=my_user,
            password=my_password,
            database=my_db
        )
        cursor = conexion.cursor()
        
        # Crear consulta SQL
        consulta = "INSERT INTO ventas (numero_factura, fecha_venta, codigo_producto, cantidad_venta, codigo_cliente) VALUES (%s, %s, %s, %s, %s)"
        valores = (numero_factura, fecha_venta, codigo_producto, cantidad_venta, codigo_cliente)
        
        # Ejecutar consulta
        cursor.execute(consulta, valores)
        conexion.commit()
        
        # Cerrar conexión
        cursor.close()
        conexion.close()
        
        # Mostrar mensaje de éxito y limpiar campos
        messagebox.showinfo('Éxito', 'Venta ingresada correctamente')
        limpiar_campos()
    except Exception as e:
        # Mostrar mensaje de error
        messagebox.showerror('Error', str(e))

# Crear ventana de tkinter con ttkbootstrap
ventana = ttk.Window(themename='superhero')
ventana.title('Ingreso de Ventas')

# Ajustar tamaño y fijar la ventana
ventana.geometry('500x200')  # Puedes ajustar las dimensiones según prefieras
ventana.resizable(False, False)  # Esto fija el tamaño de la ventana

# Crear campos de entrada
tk.Label(ventana, text='Número de Factura').grid(row=0, column=0)
entrada_numero_factura = tk.Entry(ventana)
entrada_numero_factura.grid(row=0, column=1)

tk.Label(ventana, text='Fecha de Venta (YYYY-MM-DD)').grid(row=1, column=0)
entrada_fecha_venta = tk.Entry(ventana)
entrada_fecha_venta.grid(row=1, column=1)

tk.Label(ventana, text='Código de Producto').grid(row=2, column=0)
entrada_codigo_producto = tk.Entry(ventana)
entrada_codigo_producto.grid(row=2, column=1)

tk.Label(ventana, text='Cantidad de Venta').grid(row=3, column=0)
entrada_cantidad_venta = tk.Entry(ventana)
entrada_cantidad_venta.grid(row=3, column=1)

tk.Label(ventana, text='Código de Cliente').grid(row=4, column=0)
entrada_codigo_cliente = tk.Entry(ventana)
entrada_codigo_cliente.grid(row=4, column=1)

# Botón para insertar datos con estilo de ttkbootstrap
boton_insertar = ttk.Button(ventana, text='Insertar Venta', bootstyle=PRIMARY, command=lambda: insertar_venta(
    entrada_numero_factura.get(),
    entrada_fecha_venta.get(),
    entrada_codigo_producto.get(),
    entrada_cantidad_venta.get(),
    entrada_codigo_cliente.get()
))
boton_insertar.grid(row=5, column=0, columnspan=2)

# Ejecutar ventana
ventana.mainloop()