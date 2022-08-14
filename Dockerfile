FROM debian

WORKDIR /app

RUN apt-get update && \
    apt-get install -y openssl wget && \
    wget https://github.com/mikefarah/yq/releases/download/v4.27.2/yq_linux_amd64 -O /usr/local/bin/yq && \
    chmod +x /usr/local/bin/yq 

RUN mkdir -p secrets

COPY cfssl cfssljson /usr/local/bin
COPY . .

CMD ["provision.sh"]