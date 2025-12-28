FROM n8nio/n8n:latest

USER root

# Atualiza pacotes e instala dependências
RUN apt-get update \
    && apt-get install -y python3 python3-pip ffmpeg \
    && pip3 install yt-dlp \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Pasta para downloads temporários
RUN mkdir -p /data && chown -R node:node /data

USER node

EXPOSE 5678
CMD ["n8n"]
