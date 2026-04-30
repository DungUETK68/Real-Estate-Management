# Build stage: Maven + Java 8
FROM maven:3.8.6-openjdk-8-slim AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Runtime: Tomcat (deploy WAR as ROOT)
FROM tomcat:8.5-jre8
WORKDIR /usr/local/tomcat/webapps
COPY --from=build /app/target/*.war ROOT.war
EXPOSE 8080
# Tomcat image provides its own startup command