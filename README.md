Bash Scripts for Ubuntu Application Setup

Project Description
This repository contains a collection of Bash scripts designed to automate the installation and setup of commonly used software on Ubuntu systems.
The scripts help simplify system configuration by reducing manual steps involved in installing Java, Apache, Tomcat, and Nginx.

The goal of this project is to make application installation faster, repeatable, and reliable on Ubuntu-based environments.

Overview
Managing software installations manually can be time-consuming and error-prone.
These scripts provide a straightforward way to install and configure essential services using simple shell commands, making them useful for learning, testing, and basic server setups.

Prerequisites
Before running the scripts, ensure the following:

1. Basic understanding of Linux and shell commands
2. An Ubuntu-based operating system
3. Command-line access with sudo privileges
4. Any text editor or IDE (VS Code is recommended)

Available Scripts

Script 1: Java Installation on Ubuntu
This script installs Java (supported versions included in the script).

Make the script executable and run it:
chmod +x java_8_11_ubuntu.sh
./java_8_11_ubuntu.sh

Script 2: Apache Installation on Ubuntu
This script installs and starts the Apache web server.

Make the script executable and run it:
chmod +x apache_setup_ubuntu.sh
./apache_setup_ubuntu.sh

Script 3: Tomcat Installation on Ubuntu
This script installs Apache Tomcat and allows you to choose the version during execution.

Make the script executable and run it:
chmod +x tomcat_setup_ubuntu.sh
./tomcat_setup_ubuntu.sh

Available options during execution:
1. Tomcat 9.0.87
2. Tomcat 10.1.20
3. Tomcat 11.0.0-M16

Script 4: Nginx Installation on Ubuntu
This script installs and configures the Nginx web server.

Make the script executable and run it:
chmod +x nginx_ubuntu.sh
./nginx_ubuntu.sh

Notes
- All scripts should be run with appropriate permissions
- It is recommended to review the script contents before execution
- These scripts are intended for learning and basic automation purposes
