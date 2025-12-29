#!/data/data/com.termux/files/usr/bin/bash

clear

# Colores
RED="\e[31m"
GREEN="\e[32m"
RESET="\e[0m"

# Mostrar logo
cat logo.txt
echo -e "${RED}"
echo " Metasploit Framework Installer (TERMUX)"
echo " Author: TRISKA"
echo -e "${RESET}"
echo ""

# Confirmación del usuario
read -p "¿Querés instalar Metasploit Framework en Termux? (s/n): " confirm

if [[ "$confirm" != "s" && "$confirm" != "S" ]]; then
  echo "Instalación cancelada."
  exit 0
fi

echo -e "${GREEN}[+] Actualizando Termux...${RESET}"
pkg update -y && pkg upgrade -y

echo -e "${GREEN}[+] Instalando dependencias...${RESET}"
pkg install -y \
git \
curl \
wget \
ruby \
python \
clang \
make \
openssl \
libffi \
postgresql

echo -e "${GREEN}[+] Clonando Metasploit Framework...${RESET}"
git clone https://github.com/rapid7/metasploit-framework.git
cd metasploit-framework || exit 1

echo -e "${GREEN}[+] Instalando Bundler...${RESET}"
gem install bundler

echo -e "${GREEN}[+] Instalando gems (esto tarda)...${RESET}"
bundle install

echo ""
echo -e "${GREEN}[✓] Metasploit instalado correctamente en Termux${RESET}"
echo ""
echo "Para ejecutarlo:"
echo "cd metasploit-framework"
echo "./msfconsole"