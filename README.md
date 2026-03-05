# Gestion-de-bases-de-datos

Proyecto Base de Datos RAWG

Requisitos

Para ejecutar correctamente este proyecto es necesario tener instalado:

- MySQL Server
- MySQL Workbench 8.4 o cualquier herramienta para el manejo de bases de datos MySQL
- Python
- Jupyter Notebook

Se deben instalar las siguientes librerías de Python:

- pip install pandas sqlalchemy

Estructura del proyecto
El proyecto contiene los siguientes archivos principales:

work_space.sql → Script para crear la estructura de la base de datos.

work_space.ipynb → Jupyter Notebook encargado de consumir la API de RAWG, procesar y limpiar los datos.

df_final.csv → Dataset con la información principal de los videojuegos.

df_sql.csv → Dataset preparado para ser insertado en la base de datos SQL.

df_genres.csv → Tabla con los géneros de videojuegos.

df_platform.csv → Tabla con las plataformas de videojuegos.

game_genre_mapping.csv → Tabla de relación entre videojuegos y géneros.

game_platform_mapping.csv → Tabla de relación entre videojuegos y plataformas.

Todos los archivos .csv deben estar en la misma carpeta que el Jupyter Notebook.

Pasos para ejecutar el proyecto
1. Crear la base de datos
Abrir MySQL Workbench 8.4.

Conectarse al servidor de MySQL.

Ejecutar el archivo:

work_space.sql
Este archivo creará todas las tablas necesarias para la base de datos.

2. Preparar el entorno de Python
Instalar las librerías necesarias:

- pip install pandas sqlalchemy

3. Preparar los datasets
Guardar todos los archivos CSV en la misma carpeta donde se encuentra el Jupyter Notebook.

4. Cargar los datos
Abrir el archivo:

- work_space.ipynb
Ejecutar todas las celdas del notebook.
Cambiar el usuario y contraseña por el usuario y contraseña del SQL.

Este proceso leerá los archivos CSV y cargará la información en la base de datos MySQL.

5. Realizar análisis
Una vez cargados los datos, se pueden realizar análisis como:

Análisis de géneros más comunes en videojuegos.

Relación entre plataformas y tipos de juegos.

Exploración de la popularidad de videojuegos.

Estudio de la distribución de juegos por género y plataforma.
