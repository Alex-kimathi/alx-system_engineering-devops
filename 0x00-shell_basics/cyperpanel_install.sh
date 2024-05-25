#!/bin/bash

# Ensure script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

# Function to update server packages
update_packages() {
    if [ -f /etc/debian_version ]; then
        apt update && apt upgrade -y
    elif [ -f /etc/redhat-release ]; then
        yum check-update
        yum update -y
    else
        echo "Unsupported OS. Only Debian-based and Red Hat-based systems are supported."
        exit 1
    fi
}

# Function to install expect if not installed
install_expect() {
    if [ -f /etc/debian_version ]; then
        apt install -y expect
    elif [ -f /etc/redhat-release ]; then
        yum install -y expect
    fi
}

# Function to install CyberPanel with predefined options
install_cyberpanel() {
    expect -c "
    spawn sh <(curl https://cyberpanel.net/install.sh || wget -O - https://cyberpanel.net/install.sh)
    expect \"Choose LiteSpeed WebServer ENTERPRISE or OpenLiteSpeed (1/2):\"
    send \"1\r\"
    expect \"Do you have LiteSpeed WebServer Enterprise license key? (y/n):\"
    send \"n\r\"
    expect \"Install Full Service for CyberPanel? (y/n):\"
    send \"y\r\"
    expect \"Install Memcached extension and backend?\"
    send \"y\r\"
    expect \"Install Redis extension and backend?\"
    send \"y\r\"
    expect \"Install Watchdog?\"
    send \"y\r\"
    expect eof
    "
}

# Update server packages
update_packages

# Install expect if not installed
install_expect

# Install CyberPanel
install_cyberpanel

# Display final configuration information
echo "CyberPanel installation completed. Please make sure to save any configuration details displayed."
