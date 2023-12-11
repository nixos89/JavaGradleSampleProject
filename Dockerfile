# Build stage #1
FROM maven:3.9.3-eclipse-temurin-17

COPY ./build/libs/app.jar /app
WORKDIR /app
RUN file="$(ls -la -1 .)" && echo $file
RUN file="$(cat .env)" && echo $file
RUN mvn clean package -DskipTests=true

# Runtime stage
FROM eclipse-temurin:17-jre
COPY --from=build /app/target/app.jar /app/app.jar
RUN file="$(ls -la -1 /app)" && echo $file

WORKDIR /app

EXPOSE 8000

ENTRYPOINT ["java", "-jar", "app.jar"]