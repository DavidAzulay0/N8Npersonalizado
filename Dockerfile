FROM n8nio/n8n:latest-debian

USER root

RUN apt-get update \
    && apt-get install -y \
        ffmpeg \
        python3 \
        python3-venv \
        python3-pip \
        pipx \
        ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV PATH="/root/.local/bin:$PATH"

RUN pipx install yt-dlp

USER node

