FROM n8nio/n8n:latest-debian

USER root

RUN apt-get update \
    && apt-get install -y python3 python3-pip ffmpeg \
    && pip3 install yt-dlp \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /data && chown -R node:node /data

USER node

EXPOSE 5678
CMD ["n8n"]

