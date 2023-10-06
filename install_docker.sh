#!/bin/bash

# Actualizar el sistema
sudo apt-get update

# Instalar Docker
sudo apt-get install -y docker.io#!/bin/bash

# Actualiza los paquetes
apt-get update

# Instala dependencias
apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Descarga la clave GPG de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Agrega el repositorio de Docker
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Actualiza nuevamente los paquetes
apt-get update

# Instala Docker
apt-get install -y docker-ce


# Iniciar y habilitar Docker
sudo systemctl start docker
sudo systemctl enable docker

# Agregar el usuario de Jenkins al grupo Docker (si es necesario)
sudo usermod -aG docker jenkins

# Reiniciar el servicio de Jenkins
sudo systemctl restart jenkins
