FROM n8nio/n8n:latest

USER root

# Dependências para yt-dlp
RUN apt-get update \
    && apt-get install -y \
        ffmpeg \
        python3 \
        python3-venv \
        pipx \
        ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV PATH="/root/.local/bin:$PATH"

# Instalar yt-dlp
RUN pipx install yt-dlp

USER node

