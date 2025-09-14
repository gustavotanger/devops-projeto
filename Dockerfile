# Imagem base do Python
FROM python:3.9-slim

# Define diretório de trabalho
WORKDIR /app

# Copia requirements.txt e instala dependências
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o projeto
COPY . .

# Expõe a porta que o Flask usa
EXPOSE 5000

# Comando para rodar a aplicação
CMD ["python", "app.py"]
# Imagem base do Python
FROM python:3.9-slim

# Define o diretório de trabalho no container
WORKDIR /app

# Copia os arquivos do projeto para dentro do container
COPY . /app

# Comando padrão ao rodar o container
CMD ["python", "app.py"]


