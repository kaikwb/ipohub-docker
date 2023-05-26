# Dockerfile para Build e Execução de Imagem

Este Dockerfile é usado para construir uma imagem que contém a solução do challenge com frontend e backend. O frontend é clonado de um repositório no GitHub e o backend é clonado de outro repositório. A imagem utiliza o Apache Tomcat como servidor web.

## Instruções para Build

1. Certifique-se de ter o Docker instalado e configurado na sua máquina.

2. Crie um diretório e salve o conteúdo do Dockerfile nele.

3. Abra o terminal e navegue até o diretório onde você salvou o Dockerfile.

4. Execute o seguinte comando para construir a imagem Docker:

```bash
docker build -t ipohub .
```

Aguarde a conclusão do processo de construção da imagem.

## Instruções para Execução a partir do Dockerfile

Após a conclusão bem-sucedida do build da imagem Docker, você pode executá-la em qualquer máquina com Docker instalado usando o seguinte comando:

```bash
docker run -p 8080:8080 -p 3000:3000 ipohub
```

Isso mapeará as portas locais 8080 e 3000 para as portas 8080 e 3000 do contêiner. Você pode ajustar a porta local conforme necessário.

## Instruções para Execução a partir do Docker Hub

A imagem Docker também está disponível no Docker Hub, permitindo que você a execute sem a necessidade de build.

Certifique-se de ter o Docker instalado e configurado na sua máquina.

Abra o terminal e execute o seguinte comando para baixar a imagem do Docker Hub:

```bash
docker pull kaikwb/ipohub:latest
```

Após a conclusão do download da imagem, execute-a com o seguinte comando:

```bash
docker run -p 8080:8080 -p 3000:3000 kaikwb/ipohub:latest
```

Isso mapeará as portas locais 8080 e 3000 para as portas 8080 e 3000 do contêiner. Você pode ajustar a porta local conforme necessário.

Aguarde o início do servidor Apache Tomcat e a inicialização do aplicativo.

Abra um navegador da web e acesse http://localhost:3000 para visualizar o site.
