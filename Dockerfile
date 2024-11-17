#Use the latest Alpine Linux
FROM openjdk:8-jdk-alpine

LABEL authors="Hunter Peart"

# Set environment variables for the OpenJDK 8 package
ENV LANG=C.UTF-8 \
    JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk \
    PATH=$PATH:/usr/lib/jvm/java-1.8-openjdk/bin

# Insall OpenJDK 8 on Alpine
RUN apk --no-cache add openjdk8

# Set the work directory
WORKDIR /app

# Copy the application JAR File to the container image
COPY build/libs/Homework7-1.0-all.jar Homework7-1.0-all.jar

CMD ["java", "-jar", "Homework7-1.0-all.jar", "--bucket2", "usu-cs5250-perat2-dist", "--bucket3", "usu-cs5250-perat3-dist", "--sqs", "https://sqs.us-east-1.amazonaws.com/224193139309/cs5250-requests"]

