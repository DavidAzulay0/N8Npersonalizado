FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache python3 py3-pip ffmpeg \
    && pip3 install yt-dlp

RUN mkdir -p /data && chown -R node:node /data

USER node

EXPOSE 5678
CMD ["n8n"]
