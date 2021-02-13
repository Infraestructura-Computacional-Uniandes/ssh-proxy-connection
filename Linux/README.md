# Conexión SSH en Linux

Este script permite realizar la conexión pasando como argumentos el nombre de usuario y la dirección de la maquina virtual (host). Asimismo, en caso de ejecutarlo sin pasar estos datos como argumentos, se desplegarán varios mensajes para solicitar estos datos por consola.

Despues de descargar este script, ingrese a la carpeta donde clonó el repositorio y brinde permisos de ejecución mediante

`chmod u+x mq-uniandes.sh`

### Ejecucion por argumentos

Envie los datos del nombre de usuario y el host mediante los _flags_ **-u -h** respectivamente

`./mq-uniandes.sh -u <nombre-usuario> -h <direccion-host>`

Por ejemplo:

`./mq-uniandes.sh -u prueba -h 172.24.56.12`

### Ejecución por entrada en consola

Ejecute directamente el script sin mandar flags

`./mq-uniandes.sh`
