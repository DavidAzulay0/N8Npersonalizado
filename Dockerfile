FROM n8nio/n8n:latest

# Mudar para root para instalar pacotes
USER root

# Instalar ffmpeg e pip usando o apk do Alpine, depois o yt-dlp
RUN apk update && apk add --no-cache ffmpeg py3-pip \
    && pip3 install --no-cache-dir yt-dlp

# Voltar para o usuário padrão do n8n
USER node
