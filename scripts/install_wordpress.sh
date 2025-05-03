#!/bin/bash

yum update -y
amazon-linux-extras install -y php7.4
yum install -y httpd mariadb php php-mysqlnd
systemctl enable httpd
systemctl start httpd

wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* /var/www/html/
chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html

# Configure WordPress to connect to RDS
cat <<EOF > /var/www/html/wp-config.php
<?php
define('DB_NAME', '${var.db_name}');
define('DB_USER', '${var.db_user}');
define('DB_PASSWORD', '${var.db_password}');
define('DB_HOST', '${aws_db_instance.wordpress_db.endpoint}');
EOF
