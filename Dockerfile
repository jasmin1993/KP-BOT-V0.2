FROM ghcr.io/puppeteer/puppeteer:24.2.0

# Instaliranje dodatnih zavisnosti
RUN apt-get update \
    && apt-get install -y wget gnupg \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable \
    && rm -rf /var/lib/apt/lists/*

# Postavite radni direktorijum
WORKDIR /usr/src/app

# Kopirajte package fajlove
COPY package*.json ./

# Instalirajte zavisnosti
RUN npm ci

# Kopirajte ostatak koda
COPY . .

# Environment varijable
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome

CMD [ "node", "KP-BOT-2.js" ]
