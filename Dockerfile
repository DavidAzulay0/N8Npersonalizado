FROM node:20-bookworm-slim

# Instalar dependências do sistema
RUN apt-get update \
    && apt-get install -y ffmpeg python3 python3-pip ca-certificates \
    && pip3 install --no-cache-dir yt-dlp \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instalar n8n
RUN npm install -g n8n

# Variáveis padrão
ENV NODE_ENV=production
ENV N8N_PORT=5678

EXPOSE 5678

# START CORRETO (não usar wrapper)
CMD ["node", "/usr/local/lib/node_modules/n8n/bin/n8n.js", "start"]
