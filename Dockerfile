FROM ghcr.io/puppeteer/puppeteer:24.2.0

# Postavite radni direktorijum
WORKDIR /usr/src/app

# Kopirajte package fajlove
COPY package*.json ./

# Instalirajte zavisnosti
RUN npm ci

# Kopirajte ostatak koda
COPY . .

# Postavite environment varijable za Puppeteer
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome

CMD [ "node", "KP-BOT-2.js" ]
