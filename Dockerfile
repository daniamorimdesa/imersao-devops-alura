FROM python:3.13.4-alpine3.22

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia os arquivos da aplicação para o container
COPY requirements.txt /app/

# Instala as dependências da aplicação
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante dos arquivos da aplicação para o container
COPY . .

# Expõe a porta padrão do FastAPI/Uvicorn
EXPOSE 8000

# Comando para rodar a aplicação FastAPI com Uvicorn
# Substitua 'app:app' se o nome do arquivo ou da instância FastAPI for diferente
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]