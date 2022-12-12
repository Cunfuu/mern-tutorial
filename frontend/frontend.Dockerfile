FROM node:19.2-alpine as base
RUN mkdir -p /app
WORKDIR /app
COPY frontend/package*.json ./

FROM base AS dependencies 
RUN npm install
COPY frontend/ .
RUN npm run build


FROM nginx:stable-alpine as prod
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]