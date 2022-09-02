FROM maven:3.8-eclipse-temurin-11-alpine as build

RUN apk update
RUN apk add git

WORKDIR /app
RUN git clone --depth 1 https://github.com/spring-projects/spring-petclinic.git .

RUN  mvn install

FROM openjdk:11-slim-buster as app
WORKDIR /app

COPY --from=build /app/target/spring-petclinic-*.jar /app/spring-petclinic.jar
CMD ["java", "-jar", "spring-petclinic.jar"]
