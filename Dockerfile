FROM ubuntu:latest

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y \
    curl \
    git \
    nodejs \
    npm \
    openjdk-17-jdk \
    maven \
    && rm -rf /var/lib/apt/lists/*

# Clonar o repositório do frontend
WORKDIR /app
RUN git clone https://github.com/kaikwb/ipohub frontend

# Configurar o ambiente do frontend
WORKDIR /app/frontend
RUN npm install

# Clonar o repositório do backend
WORKDIR /app
RUN git clone https://github.com/kaikwb/b3-challenge-backend backend

# Configurar o ambiente do backend
WORKDIR /app/backend
RUN mvn clean install

# Configurar o Tomcat
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
WORKDIR $CATALINA_HOME
RUN curl -O https://downloads.apache.org/tomcat/tomcat-11/v11.0.0-M6/bin/apache-tomcat-11.0.0-M6.tar.gz && \
    tar -xvf apache-tomcat-11.0.0-M6.tar.gz && \
    rm apache-tomcat-11.0.0-M6.tar.gz && \
    mv apache-tomcat-11.0.0-M6/* /usr/local/tomcat/ && \
    rmdir apache-tomcat-11.0.0-M6
COPY tomcat-users.xml $CATALINA_HOME/conf/

# Remover o aplicativo padrão do Tomcat
RUN rm -rf $CATALINA_HOME/webapps/ROOT

# Copiar o arquivo WAR para o Tomcat
RUN cp /app/backend/target/b3-challenge-backend.war $CATALINA_HOME/webapps/ROOT.war

# Configurar o ponto de entrada
COPY docker-entrypoint.sh ./
RUN chmod +x docker-entrypoint.sh

# Expor as portas
EXPOSE 3000
EXPOSE 8080

# Comando de entrada
ENTRYPOINT ["./docker-entrypoint.sh"]
