#!/bin/bash

echo "📁 Creating Spring Boot backend folder structure and files..."

mkdir -p backend/src/main/java/dev/akashpatil/library/controller
mkdir -p backend/src/main/resources

# --- Dockerfile ---
cat <<EOF > backend/Dockerfile
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/LibrarySystem-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 9090
ENTRYPOINT ["java", "-jar", "app.jar"]
EOF

# --- pom.xml ---
cat <<EOF > backend/pom.xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
                             http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>dev.akashpatil</groupId>
    <artifactId>LibrarySystem</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>LibraryManagement</name>
    <description>Spring Boot Library App</description>
    <packaging>jar</packaging>

    <properties>
        <java.version>17</java.version>
    </properties>

    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>

        <dependency>
            <groupId>com.mysql</groupId>
            <artifactId>mysql-connector-j</artifactId>
            <scope>runtime</scope>
        </dependency>

        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter</artifactId>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
                <version>3.2.5</version>
            </plugin>
        </plugins>
    </build>
</project>
EOF

# --- LibraryApplication.java ---
cat <<EOF > backend/src/main/java/dev/akashpatil/library/LibraryApplication.java
package dev.akashpatil.library;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class LibraryApplication {
    public static void main(String[] args) {
        SpringApplication.run(LibraryApplication.class, args);
    }
}
EOF

# --- HelloController.java ---
cat <<EOF > backend/src/main/java/dev/akashpatil/library/controller/HelloController.java
package dev.akashpatil.library.controller;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class HelloController {

    @GetMapping("/hello")
    public String hello() {
        return "Hey love! Your Library App is running 💖";
    }
}
EOF

# --- application.properties ---
cat <<EOF > backend/src/main/resources/application.properties
spring.datasource.url=jdbc:mysql://db:3306/librarydb
spring.datasource.username=libraryuser
spring.datasource.password=librarypass
spring.jpa.hibernate.ddl-auto=update
server.port=9090
EOF

echo "✅ Spring Boot backend files generated successfully!"
