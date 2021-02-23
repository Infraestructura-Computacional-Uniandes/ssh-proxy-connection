#!/bin/bash
# Por favor ejecutar con permisos sudo

# Vamos a ingresar a la carpeta /tmp para evitar dejar basura en nuestra carpeta personal
cd /tmp

# Actualizar paquetes
sudo apt-get update

# Instalar Screen
sudo apt-get install -y screen

# Instalar compiladores fundamentales (GCC, GCC++, entre otros), para ello utilizaremos build-essential
sudo apt-get install -y build-essential

# Instalar Docker
# Tutorial: https://docs.docker.com/engine/install/ubuntu/
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
echo "Docker instalado \n"

# Instalar Docker Compose
# Tutorial: https://docs.docker.com/compose/install/
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo "Docker Compose instalado \n"

# Instalar los comandos de control de Kubernetes (kubectl)
sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2 curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
echo "Comandos Kubectl instalados"

# Instalar minikube (Kubernetes)
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
echo "Minikube instalado"

# Despedida
echo "---------------------------------------"
echo "Script de instalacion finalizado"
echo ""
echo "Cierre esta sesión e ingrese nuevamente."
echo "Ejecute: sudo usermod -aG docker $(whoami)"
echo "y cierre sesion e ingrese nuevamente. Para concluir, despues de iniciar sesion por segunda vez, ejecute:"
echo "minikube start"
echo "---------------------------------------"