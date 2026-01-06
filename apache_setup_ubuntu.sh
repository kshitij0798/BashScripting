#!/bin/bash

# ===== Colors =====
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BOLD='\033[1m'
RESET='\033[0m'

clear
echo -e "${GREEN}${BOLD}Apache Installation Script Started${RESET}"
sleep 2

# ===== Update System =====
echo -e "${YELLOW}Updating system packages...${RESET}"
sudo apt update -y

# ===== Install Apache =====
echo -e "${YELLOW}Installing Apache...${RESET}"
sudo apt install apache2 -y

# ===== Start & Enable Apache =====
sudo systemctl start apache2
sudo systemctl enable apache2

echo -e "${GREEN}Apache service is running:${RESET}"
sudo systemctl status apache2 | grep Active
sleep 2

# ===== User Input =====
read -p "Enter Virtual Host name (example: mysite): " VHOST
read -p "Enter Domain name (example: example.com): " DOMAIN

# ===== Create Virtual Host Config =====
CONF_FILE="/etc/apache2/sites-available/$VHOST.conf"

sudo bash -c "cat > $CONF_FILE" <<EOF
<VirtualHost *:80>
    ServerName $DOMAIN
    ServerAlias www.$DOMAIN
    DocumentRoot /var/www/html/$VHOST

    ErrorLog \${APACHE_LOG_DIR}/$VHOST-error.log
    CustomLog \${APACHE_LOG_DIR}/$VHOST-access.log combined
</VirtualHost>
EOF

echo -e "${GREEN}Virtual host config created: $CONF_FILE${RESET}"

# ===== Enable Site & Reload Apache =====
sudo a2ensite $VHOST.conf
sudo systemctl reload apache2

# ===== Create Web Directory =====
WEB_ROOT="/var/www/html/$VHOST"
sudo mkdir -p $WEB_ROOT

sudo bash -c "cat > $WEB_ROOT/index.html" <<EOF
<html>
<body>
<h1 style="color:blue;">Welcome to $DOMAIN</h1>
</body>
</html>
EOF

sudo chown -R www-data:www-data $WEB_ROOT

echo -e "${GREEN}Website files created successfully${RESET}"

# ===== Firewall Setup =====
echo -e "${YELLOW}Configuring firewall...${RESET}"
sudo ufw allow 80
sudo ufw --force enable

# ===== Test Website =====
echo -e "${YELLOW}Testing website locally...${RESET}"
sudo apt install curl -y
curl http://localhost | head -n 5

echo -e "${GREEN}${BOLD}Apache Installation Completed Successfully!${RESET}"
