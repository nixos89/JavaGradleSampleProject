# Build stage #1
FROM gradle:jdk17-jammy

COPY ./build/libs/java-github-actions-demo-0.0.1-SNAPSHOT.jar /usr/app/app.jar
WORKDIR /usr/app

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]