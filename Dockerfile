FROM n8nio/n8n:latest

# Mudar para root para instalar pacotes
USER root

# Instalar ffmpeg e yt-dlp diretamente com o apk
RUN apk update && apk add --no-cache ffmpeg yt-dlp

# Voltar para o usuário padrão do n8n
USER node
