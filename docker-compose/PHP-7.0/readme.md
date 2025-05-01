# Docker Compose for PHP

This repository contains the necessary files and configurations to dockerize a PHP application. This guide will help you understand the directory structure, configurations, and steps needed to set up your Docker environment.

## Directory Structure

```markdown
app.example.com/
│
├── docker-compose.yml
├── app/                         # Project source code
├── conf/
│   ├── Dockerfile               # Dockerfile for PHP environment
│   ├── php.ini                  # Custom PHP configuration file
│   └── vhosts/
│       └── vhosts.conf          # Apache Virtual Hosts configuration

```