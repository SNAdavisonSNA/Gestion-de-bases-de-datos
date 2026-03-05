# Proyecto Base de Datos IGDB

## Requisitos

Para ejecutar correctamente este proyecto es necesario tener instalado:

- MySQL Server
- MySQL Workbench 8.4 o cualquier herramienta para de manejo de bases de datos de MySQL
- Python
- Jupyter Notebook

Se deben instalar las siguientes librerías de Python:

```python
pip install pandas sqlalchemy
Estructura del proyecto

El proyecto contiene los siguientes archivos principales:

schema.sql → Script para crear la estructura de la base de datos.

consultas.sql → Archivo con las consultas SQL del proyecto.

notebook.ipynb → Jupyter Notebook encargado de cargar los datos.

Archivos .csv → Datasets utilizados para insertar la información en la base de datos.

Todos los archivos .csv deben estar en la misma carpeta que el Jupyter Notebook.

Pasos para ejecutar el proyecto
1. Crear la base de datos

Abrir MySQL Workbench 8.4.

Conectarse al servidor de MySQL.

Ejecutar el archivo:

schema.sql

Este archivo creará todas las tablas necesarias para la base de datos.

2. Preparar el entorno de Python

Instalar las librerías necesarias:

pip install pandas sqlalchemy


3. Preparar los datasets

Guardar todos los archivos CSV en la misma carpeta donde se encuentra el Jupyter Notebook.

4. Cargar los datos

Abrir el archivo:

notebook.ipynb

Ejecutar todas las celdas del notebook.
Cambiar el 'usuario' y 'contraseña' por el usuario y contraseña del SQL  

Este proceso leerá los archivos CSV y cargará la información en la base de datos MySQL.

5. Ejecutar las consultas

Finalmente, para realizar las consultas del proyecto:

Abrir MySQL Workbench.

Ejecutar el archivo:

consultas.sql

Este archivo contiene todas las consultas utilizadas para el análisis de la base de datos.