#!/bin/bash

#########################################################################
# - Instruções de instalação Servidor Seguro                            #
#                                                                       #
# Nome:Install_ss.sh                                                     #
#                                                                       #
# Autor: André Jorge (andre.santos@rw3tecnologia.com)                   #
# Data: DD/MM/AAAA                                                      #
#                                                                       #
# Descrição: Baseado em informações segura, o script instala o ss       #
# no servidor seguro                                                    #
#                                                                       #
# Uso: ./install_ss.sh                                                   #
#                                                                       #
#########################################################################
read -p "Adcione a senha do usuário do xroad, digite o password secret: "

sudo adduser xroad-admin

nano /etc/environment

sudo apt-get update -y

sudo apt-get install locales software-properties-common curl

sudo locale-gen en_US.UTF-8 pt_BR.UTF-8

sudo apt-get update -y

wget https://storage.googleapis.com/xvia-release/xvia-ubuntu18.04-v6.23.0.tar.gz --no-check-certificate

sudo rm -rf xvia

tar -xzvf xvia-ubuntu18.04-v6.23.0.tar.gz

sudo chmod 500 ./xvia/ubuntu18.04/install-securityserver.sh

sudo ./xvia/ubuntu18.04/install-securityserver.sh

sudo systemctl list-units "xroad*"

PORC_EXIBIDA=0

exit







