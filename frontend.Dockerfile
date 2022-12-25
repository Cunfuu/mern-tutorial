FROM node:19.2-alpine as base
RUN mkdir -p /app
WORKDIR /appx
COPY frontend/package*.json ./

FROM base AS build-stage 
RUN npm install
COPY frontend/ .
RUN npm run build


FROM base as prod
COPY --from=build-stage /app/prod_node_modules ./node_modules
COPY --from=build-stage  /app/build ./build
COPY frontend/ .

CMD npm run start