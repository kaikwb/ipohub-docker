#!/bin/bash

# Iniciar o Tomcat
/usr/local/tomcat/bin/catalina.sh run &

# Iniciar o frontend
cd /app/frontend
npm start
