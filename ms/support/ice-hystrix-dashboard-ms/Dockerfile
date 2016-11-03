FROM java:8-jre
MAINTAINER OUSSAMA EL ABED <oel3abed@gmail.com>

ADD ./build/libs/*.jar /app/app.jar
CMD ["java", "-Xmx200m", "-jar", "/app/app.jar"]

EXPOSE 8080