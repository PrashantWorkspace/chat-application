# 🛠️ Build Stage: Use Maven to build the application
FROM maven:3.8.5-openjdk-17-slim AS build
WORKDIR /app

# Step 1: Copy pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Step 2: Copy source code
COPY src ./src

# Build the project, skipping tests
RUN mvn clean install -DskipTests=true

# 🚀 Run Stage: Use lightweight OpenJDK Alpine image
FROM openjdk:17-alpine

# Install timezone data and set to Asia/Ho_Chi_Minh
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime && \
    echo "Asia/Ho_Chi_Minh" > /etc/timezone

# Create a non-root user
RUN adduser -D coms-prashant

WORKDIR /run

# Copy the built JAR from the build stage
COPY --from=build /app/target/real-time-chat-0.0.1-SNAPSHOT.jar /run/app.jar

# ✅ Fix: Ensure ownership is set correctly
RUN chown -R coms-prashant /run

# Switch to non-root user
USER coms-prashant

# Expose application port
EXPOSE 8081

# Start the application
ENTRYPOINT ["java", "-jar", "/run/app.jar"]