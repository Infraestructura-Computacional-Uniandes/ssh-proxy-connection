#!/bin/bash

# Despues de haber indicado el interprete (linea 1), vamos a pedir algunos datos de entrada
# para conectarnos directamente a la maquina.

# Formas de uso: 
# 1) Directamente: mq-uniandes.sh -u <usuario> -h <direccion-host>
# 2) Tipeando los datos (User friendly): mq-uniandes.sh

# Definimos una funcion para realizar la conexión
function connect_to_ssh () {

    # Abrir la conexión SSH
    # Los argumentos de esta funcion se pasan por espacios al invocarla
    # el primero ocupara la posicion $1, el segundo la $2 y asi sucesivamente
    # la $0 esta reservada para el nombre de la funcion

    # El $1 sera el usuario y el $2 el host
    ssh $1@$2 -o "ProxyCommand=nc -X connect -x connect.virtual.uniandes.edu.co:443 %h %p"
};

# Dejamos habilitadas dos formas de usar el script. La primera consiste en tipear directamente
# la informacion necesaria. La segunda es pasar la informacion directamente al llamar al script
# usando flags (sí, es analogo a los parametros de entrada cuando llamamos un script en Python
# o al String[] args en el main de Java).

# En primer lugar vamos a definir la forma de conectarnos pidiendo al usuario que 
# tipee los datos

function ask_for_data () {
    # Vamos a imprimir algunos mensajes al usuario.
    # Luego, vamos a solicitar directamente la direccion del host asi como el usuario 
    #        con el que se desea conectar

    echo "-----------------------------------------"
    echo "------------ Bienvenido -----------------"
    echo "-----------------------------------------"
    echo ""
    echo "--------- Conexion via SSH --------------"
    echo "----- utilizando proxy a Uniandes -------"
    echo "-----------------------------------------"
    echo ""
    echo ""
    echo "Por favor ingrese el usuario con el que se desea conectar"
    echo "---------------------------------------------------------"
    echo "Usuario: "
    read user
    echo ""
    echo "Por favor ingrese la direccion del host al que se desea conectar"
    echo "----------------------------------------------------------------"
    echo "Host: "
    read host
    echo ""
    echo "Iniciando conexion"
    echo "------------------"

    connect_to_ssh $user $host
};

# Ejecucion principal

# En primer lugar, vamos a validar si el usuario mando los parametros usando un flag
# o si desea tipearlos despues de mostrar el mensaje de bienvenida

# Verificamos si el usuario ingreso 2 parametros usando flags

# Como mencionamos vamos a usar flags
# La funcion getopts nos permite recuperar los argumentos
# y la variable OPTARG recuperarlos segun sea el caso
while getopts u:h: flag
do
    case "${flag}" in
        u) user=${OPTARG};;
        h) host=${OPTARG};;            
    esac
done

# Los espacios son importantes en la condicion
if [ ${#user} -gt 2 ] && [ ${#host} -gt 2 ];
then
    connect_to_ssh $user $host;
    exit 0 
else
    # Pedimos que los tipee
    ask_for_data;
    exit 0
fi