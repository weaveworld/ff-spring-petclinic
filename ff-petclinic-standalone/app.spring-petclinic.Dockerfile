FROM maven:3.8-eclipse-temurin-11-alpine

RUN apk update
RUN apk add git

WORKDIR /
RUN git clone https://github.com/spring-projects/spring-petclinic.git app

WORKDIR /app
CMD [ "mvn", "install", "spring-boot:run" ]
