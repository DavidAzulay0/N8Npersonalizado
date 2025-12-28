FROM node:20-bookworm-slim

# Dependências do sistema
RUN apt-get update \
    && apt-get install -y \
        ffmpeg \
        python3 \
        python3-venv \
        pipx \
        ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Garantir que pipx esteja no PATH
ENV PATH="/root/.local/bin:$PATH"

# Instalar yt-dlp via pipx (CORRETO no Debian 12)
RUN pipx install yt-dlp

# Instalar n8n
RUN npm install -g n8n

ENV NODE_ENV=production
ENV N8N_PORT=5678

EXPOSE 5678

CMD ["node", "/usr/local/lib/node_modules/n8n/bin/n8n.js", "start"]

