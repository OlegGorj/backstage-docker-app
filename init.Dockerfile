# Stage 1: Node.js base
FROM node:20.11.1-alpine3.19 AS node_base

# Stage 2: Final image
FROM docker:24.0.7-dind

WORKDIR /app

# Copy Node.js from base image
COPY --from=node_base /usr/local/bin/node /usr/local/bin/
COPY --from=node_base /usr/local/bin/npm /usr/local/bin/
COPY --from=node_base /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=node_base /usr/local/include/node /usr/local/include/node

# Install system dependencies
RUN apk update && \
    apk add --no-cache \
        expect \
        bash \
        curl \
        git \
        python3 \
        build-base \
        musl-dev \
        libc-dev \
        sqlite \
        sqlite-dev \
        c-ares-dev \
        libstdc++

# Verify Node.js installation
RUN rm -f /usr/local/bin/npm && \
    ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm && \
    node --version && \
    npm --version

# Configure npm and install required packages
RUN npm config set package-lock=true && \
    npm config set update-notifier=false && \
    npm install -g npm@10.2.4

# Install yarn globally
RUN npm install -g yarn@1.22.21 --force

COPY ./init.exp /init.exp
RUN chmod +x /init.exp

ENTRYPOINT [ "/init.exp" ]
