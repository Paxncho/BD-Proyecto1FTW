
Para ejecutar la aplicacion, se debe modificar el archivo "conexion.txt", para la primera linea concidere su base de datos, la segunda corresponde al nombre del servidor y la tercera a su contraseña.
Es importante importar la base de datos implementada para el proyecto "db_ayudantia_backup.sql", esta contiene la informacion nececesaria para que se vea la funcionalidad de la aplicacion.
En la aplicacion se consideran 3 tipos de usuarios, profesor, ayudante y tutor, estos se diferenciaran por sus funcionalidades dentro de la aplicacion, las que seran:

Todos:
* Ver las Evaluaciones
* Ver información alumnos

Profesor:
* Crear Módulos/Ayudantías/Tutorías
* Asignar Ayudantes/Tutores
* Poner Notas
* Crear Evaluaciones
* Asignar Alumnos a Módulos/Ayudantías/Tutorías

Ayudante:
* Asignar Alumnos a Ayudantía/Tutoría
* Crear Evaluaciones

Tutor:
* Eliminar Alumnos de Tutorías

