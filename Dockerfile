# ===== Stage 1: baixar yt-dlp =====
FROM alpine:3.19 AS ytdlp

RUN apk add --no-cache curl \
    && curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp \
        -o /yt-dlp \
    && chmod +x /yt-dlp


# ===== Stage 2: n8n oficial =====
FROM n8nio/n8n:stable

USER root

# Copiar o binário yt-dlp
COPY --from=ytdlp /yt-dlp /usr/local/bin/yt-dlp

USER node
