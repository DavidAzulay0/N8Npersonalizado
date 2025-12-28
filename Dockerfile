FROM n8nio/n8n:latest

USER root

# Instalar dependências no Alpine
RUN apk add --no-cache \
    ffmpeg \
    python3 \
    py3-virtualenv \
    py3-pip \
    pipx \
    ca-certificates

# Garantir pipx no PATH
ENV PATH="/root/.local/bin:$PATH"

# Instalar yt-dlp via pipx (correto no Alpine)
RUN pipx install yt-dlp

USER node

