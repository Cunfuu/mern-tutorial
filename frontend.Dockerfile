FROM node:19.2-alpine as base
RUN mkdir -p /app
WORKDIR /app
COPY frontend/package*.json ./

RUN npm install
COPY frontend/ .
RUN npm run build

COPY frontend/ .

CMD npm run start