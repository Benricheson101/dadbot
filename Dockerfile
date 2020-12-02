FROM node:alpine

RUN apk add --no-cache tini
# Tini is now available at /sbin/tini
ENTRYPOINT ["/sbin/tini", "--"]

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --only=production

# REMOVE FOLLOWING LINE WHEN DONE TESTING
RUN DEBUG=true

COPY . .

CMD [ "node", "bot.js" ]