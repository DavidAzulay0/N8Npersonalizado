FROM n8nio/n8n:latest

# mudar para root temporariamente
USER root

# instalar yt-dlp + ffmpeg
RUN apt-get update && apt-get install -y python3-pip ffmpeg \
    && pip3 install --no-cache-dir yt-dlp \
    && rm -rf /var/lib/apt/lists/*

# voltar para o usuário padrão do n8n
USER node

