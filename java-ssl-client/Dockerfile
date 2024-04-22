# Use the official Java 21 Eclipse Temurin image as parent image
FROM eclipse-temurin:21-jdk

# Set the workdir in the docker image
WORKDIR /usr/src/app

# Create necessary directories
RUN mkdir -p src/main/java/net/christopherschultz/ssltest
RUN mkdir classes

# Copy the source code into package structure
COPY src/java/net/christopherschultz/ssltest/SSLTest.java src/main/java/net/christopherschultz/ssltest/
COPY src/java/net/christopherschultz/ssltest/SSLUtils.java src/main/java/net/christopherschultz/ssltest/

# Compile the java files and output the .class files into classes folder maintaining package structure
RUN javac -d classes src/main/java/net/christopherschultz/ssltest/SSLTest.java src/main/java/net/christopherschultz/ssltest/SSLUtils.java
