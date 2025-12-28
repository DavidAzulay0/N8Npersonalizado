FROM node:20-bookworm

# Instala dependências do sistema
RUN apt-get update \
    && apt-get install -y python3 python3-pip ffmpeg \
    && pip3 install --no-cache-dir yt-dlp \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instala n8n via npm
RUN npm install -g n8n

# Pasta persistente
RUN mkdir -p /data && mkdir -p /root/.n8n

# Variáveis padrão do n8n
ENV N8N_PORT=5678
ENV N8N_USER_FOLDER=/root/.n8n

EXPOSE 5678

CMD ["n8n"]




