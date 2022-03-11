FROM amazoncorretto:11-alpine-jdk
ADD target/pocspringpostgresql.jar pocspringpostgresql.jar
ENTRYPOINT ["java", "-jar","pocspringpostgresql.jar"]
EXPOSE 8080