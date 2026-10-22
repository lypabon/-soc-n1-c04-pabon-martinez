#!/usr/bin/env bash
# Instala GLPI (verificar la versión estable vigente y sus requisitos: 11.0.x exige PHP>=8.2 y MariaDB>=10.6).
# Uso: sudo ./02_instalar_glpi.sh <VERSION> <dominio>     (ej. 11.0.1 soporte.lumbredigital.example)
set -euo pipefail
VER="${1:?versión}"; DOM="${2:?dominio}"
sudo apt -y install apache2 mariadb-server php php-cli libapache2-mod-php php-mysql php-curl php-gd php-intl \
  php-mbstring php-xml php-zip php-bz2 php-ldap php-apcu php-bcmath php-opcache certbot python3-certbot-apache
PHPV=$(php -r 'echo PHP_MAJOR_VERSION.".".PHP_MINOR_VERSION;')
sudo tee /etc/php/$PHPV/apache2/conf.d/99-glpi.ini >/dev/null <<'INI'
memory_limit = 256M
upload_max_filesize = 20M
post_max_size = 20M
max_execution_time = 60
session.cookie_httponly = On
session.cookie_secure = On
session.cookie_samesite = Lax
INI
read -rsp "Clave para glpiuser (no se guarda): " DBPASS; echo
sudo mariadb-secure-installation
sudo mariadb <<SQL
CREATE DATABASE IF NOT EXISTS glpidb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'glpiuser'@'localhost' IDENTIFIED BY '${DBPASS}';
GRANT ALL PRIVILEGES ON glpidb.* TO 'glpiuser'@'localhost';
GRANT SELECT ON mysql.time_zone_name TO 'glpiuser'@'localhost';
FLUSH PRIVILEGES;
SQL
mariadb-tzinfo-to-sql /usr/share/zoneinfo | sudo mariadb mysql
cd /tmp && wget -q "https://github.com/glpi-project/glpi/releases/download/${VER}/glpi-${VER}.tgz"
sudo tar -xzf "glpi-${VER}.tgz" -C /var/www/ && sudo chown -R www-data:www-data /var/www/glpi
sed "s/soporte.lumbredigital.example/${DOM}/" "$(dirname "$0")/glpi-apache.conf" | sudo tee /etc/apache2/sites-available/glpi.conf >/dev/null
sudo a2enmod rewrite headers && sudo a2dissite 000-default.conf && sudo a2ensite glpi.conf && sudo systemctl reload apache2
sudo certbot --apache -d "$DOM" --redirect
echo '* * * * * www-data /usr/bin/php /var/www/glpi/front/cron.php > /dev/null 2>&1' | sudo tee /etc/cron.d/glpi
echo "Siga el asistente web; luego: cambiar clave de 'glpi', crear lp-superadmin, desactivar tech/normal/post-only,"
echo "borrar install/install.php si existe y poner las acciones automáticas en modo CLI."
