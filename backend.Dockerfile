# BASE
FROM node:19.2-alpine AS base
RUN apk add nodejs tini
WORKDIR /app

ENTRYPOINT ["/sbin/tini", "--"]

COPY package*.json ./

# needs

FROM base AS dependencies 

RUN npm set progress=false && npm config set depth 0
RUN npm install --only=production 
RUN cp -R node_modules prod_node_modules
# install ALL node_modules, including 'devDependencies'
RUN npm install


# Release
FROM base AS release
COPY --from=dependencies /app/prod_node_modules ./node_modules

COPY backend/ ./

CMD npm run start

# Multi stage for bigger projects.
