FROM node:20-bookworm

# Dependências do sistema
RUN apt-get update \
    && apt-get install -y python3 python3-pip ffmpeg \
    && pip3 install --no-cache-dir yt-dlp \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instala n8n
RUN npm install -g n8n

# Diretórios obrigatórios
RUN mkdir -p /data /root/.n8n

# Variáveis críticas
ENV N8N_PORT=5678
ENV N8N_LISTEN_ADDRESS=0.0.0.0
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http
ENV N8N_USER_FOLDER=/root/.n8n

EXPOSE 5678

CMD ["n8n", "start"]

