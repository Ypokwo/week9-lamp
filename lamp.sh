#!/bin/bash
# Author: Ypokwo

# Check the operating System to know command to run

yum update -y
yum install httpd -y
systemctl enable httpd
systemctl start httpd

echo "Apache has been install successfuly"

# Installing MySQL
yum install mariadb-server -y
# Start and enable msql service
systemctl start mariadb
systemctl enable mariadb

# Function to run mysql_secure_installation tasks
secure_mysql_installation() {
    echo "Securing MySQL/MariaDB installation..."

    # Prompt for MySQL root password
    read -sp "Enter MySQL root password: " mysql_root_password
    echo

    # Run mysql_secure_installation tasks
    echo "Y" | sudo mysql_secure_installation <<EOF

$mysql_root_password
y
y
y
y
y
EOF

    echo "MySQL/MariaDB installation secured."
}

# Main function
main() {
    echo "Starting MySQL/MariaDB secure installation script..."
    secure_mysql_installation
    echo "MySQL/MariaDB secure installation script completed."
}

# Run the script
main
