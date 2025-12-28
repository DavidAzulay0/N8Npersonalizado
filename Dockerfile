FROM n8nio/n8n:stable

USER root

# Instalar yt-dlp como binário
RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp \
    -o /usr/local/bin/yt-dlp \
    && chmod +x /usr/local/bin/yt-dlp

# ffmpeg já vem disponível na imagem stable
# (se não vier, o yt-dlp ainda funciona sem mux avançado)

USER node
