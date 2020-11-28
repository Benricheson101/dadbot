FROM node:alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --only=production

# REMOVE FOLLOWING LINE WHEN DONE TESTING
RUN DEBUG=true

COPY . .

CMD [ "node", "bot.js" ]