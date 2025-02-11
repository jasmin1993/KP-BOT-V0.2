FROM ghcr.io/puppeteer/puppeteer:24.2.0

# Instaliraj Chromium i potrebne zavisnosti
RUN apt-get update && apt-get install -y chromium-browser

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci
COPY . .

CMD [ "node", "KP-BOT-2.js" ]
