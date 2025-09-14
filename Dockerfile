# Imagem base do Python
FROM python:3.9-slim

# Define o diretório de trabalho no container
WORKDIR /app

# Copia os arquivos do projeto para dentro do container
COPY . /app

# Comando padrão ao rodar o container
CMD ["python", "app.py"]


