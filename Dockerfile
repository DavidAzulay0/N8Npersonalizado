FROM node:20-bookworm

# Instala dependências do sistema
RUN apt-get update \
    && apt-get install -y python3 python3-pip python3-venv pipx ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Garante que pipx esteja no PATH
ENV PATH=/root/.local/bin:$PATH

# Instala yt-dlp via pipx (forma correta no Debian 12)
RUN pipx install yt-dlp

# Instala n8n
RUN npm install -g n8n

# Pastas persistentes
RUN mkdir -p /data /root/.n8n

ENV N8N_PORT=5678
ENV N8N_USER_FOLDER=/root/.n8n

EXPOSE 5678
CMD ["sh", "-c", "n8n start --port $PORT --host 0.0.0.0"]



