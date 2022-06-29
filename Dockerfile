FROM maven:3.8.5-openjdk-17 AS build 

WORKDIR /home/app/src/
COPY . .
RUN mvn clean package 

FROM openjdk:17.0.2-oracle
COPY --from=build /home/app/src/target/*.jar /usr/local/lib/nazli.jar
EXPOSE 8080
ENTRYPOINT [ "java","-jar","/usr/local/lib/nazli.jar" ]
