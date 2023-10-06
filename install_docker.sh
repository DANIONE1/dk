#!/bin/bash

# Actualizar el sistema
sudo apt-get update

# Instalar Docker
sudo apt-get install -y docker.io

# Iniciar y habilitar Docker
sudo systemctl start docker
sudo systemctl enable docker

# Agregar el usuario de Jenkins al grupo Docker (si es necesario)
sudo usermod -aG docker jenkins

# Reiniciar el servicio de Jenkins
sudo systemctl restart jenkins
