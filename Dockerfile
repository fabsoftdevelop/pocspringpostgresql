#FROM amazoncorretto:11-alpine-jdk
FROM openjdk:8-jre-alpine
ADD target/pocspringpostgresql.jar pocspringpostgresql.jar
ENTRYPOINT ["java", "-jar","pocspringpostgresql.jar"]
EXPOSE 8080