# Stage 1: Build Stage (Maven use karke JAR banana)
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app

# Sabse pehle pom.xml copy karo aur dependencies download karo
COPY pom.xml .
RUN mvn dependency:go-offline

# Ab poora source code copy karo aur build karo
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run Stage (Sirf JAR ko chalana)
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Pehle stage se sirf bani-banayi JAR file uthao
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]