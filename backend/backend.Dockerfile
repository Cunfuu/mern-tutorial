FROM openjdk:19-jdk-alpine3.16 as base


RUN mkdir -p /app
WORKDIR /app

FROM base as release

COPY backend/build/libs/*.jar ./app.jar
CMD [ "java", "-jar", "./app.jar" ]