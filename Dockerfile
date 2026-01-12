# 1. OS aur Java setup karna
FROM eclipse-temurin:17-jdk-alpine

# 2. Apni JAR file ko container ke andar copy karna
COPY MyAPI.jar app.jar

# 3. Port batana (Spring Boot default 8080 use karta hai)
EXPOSE 8080

# 4. App ko chalu karne ki command
ENTRYPOINT ["java", "-jar", "/app.jar"]