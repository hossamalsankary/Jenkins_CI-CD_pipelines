FROM node:16-alpine

ENV NODE_ENV=production

WORKDIR /opt




COPY ["package.json", "./"]


RUN npm install


COPY . .



RUN npm run start 


CMD node server.js