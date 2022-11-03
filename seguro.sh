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
read -p "INFORME A SENHA ABAIXO PARA USUÁRIO XROAD, PRESSIONE ENTER: "

sudo adduser xroad

cat <<EOF > /etc/environment

  LC_ALL=en_US.UTF-8

EOF

sudo apt-get update -y

sudo apt-get install locales software-properties-common curl -Y

sudo locale-gen en_US.UTF-8 pt_BR.UTF-8

sudo apt-get update -y

curl https://artifactory.niis.org/api/gpg/key/public | sudo apt-key add -

sudo apt-add-repository -y "deb https://artifactory.niis.org/xroad-release-deb $(lsb_release -sc)-current main"

sudo apt-get update -y

sudo apt install xroad-database-remote -y

sudo debconf-set-selections <<< 'xroad-addon-messagelog xroad-addon-messagelog/enable-messagelog boolean false'

sudo apt install xroad-securityserver -y

sudo systemctl list-units "xroad*"

PORC_EXIBIDA=0

exit









