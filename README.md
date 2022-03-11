#### Requisitos:
1. Maven.
2. Docker.

#### Pasos para ejecutar el proyecto:

1. Generar el jar con el comando: mvn clean install -e
2. En la raíz del proyecto ejecutar: docker-compose up -d. Este comando descargará las imagenes de un contenedor para desplegar el jar que contiene una JDK y una imagen para postgresql que se llenará a partir de los datos que se encuentran en el script init.sql en la carpeta resources/script/
3. Si se desea detener la solución se debe ejecutar: docker-compose download


#### Uso de la solución:

1. La URL para insertar un usuario es POST http://localhost:8080/user/ y un payload puede ser el siguiente:
   {
   "role": "role1",
   "password":"password",
   "username":"username1"
   }

NOTA: Es importarte que en cada registro se use un username diferente, la validación de que sean diferentes no está implementada, es un TODO
