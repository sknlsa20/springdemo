# Use Maven with JDK 17
FROM maven:3.9.6-eclipse-temurin-17 AS builder

# Set working directory
WORKDIR /app

# Copy the rest of the source code
COPY . .

# Package the application (skip tests if needed)
RUN mvn clean package -DskipTests

# --------------------------
# Second stage: runtime only
# --------------------------
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy JAR from builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose app port
EXPOSE 8080

# Run the app
CMD ["java", "-jar", "app.jar"]
