FROM maven:3.8-eclipse-temurin-11-alpine

RUN apk update
RUN apk add git

WORKDIR /app
RUN git clone --depth 1 https://github.com/spring-projects/spring-petclinic.git .

CMD [ "mvn", "install", "spring-boot:run" ]
