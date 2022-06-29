FROM maven:3.8.3-eclipse-temurin-16 AS build 

WORKDIR /home/app/src/
COPY . .
RUN mvn clean package 

FROM openjdk:19-jdk-alpine3.16
COPY --from=build /home/app/src/target/*.jar /usr/local/lib/nazli.jar
EXPOSE 8080
ENTRYPOINT [ "java","-jar","/usr/local/lib/nazli.jar" ]
