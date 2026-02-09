FROM eclipse-temurin:8-jdk AS builder

WORKDIR /app
COPY pom.xml mvnw ./
COPY .mvn/wrapper/ .mvn/wrapper/

RUN chmod +x mvnw
RUN ./mvnw dependency:go-offline -B
COPY src ./src
RUN ./mvnw clean package -DskipTests

FROM eclipse-temurin:8-jre
RUN groupadd -r appuser && useradd -r -g appuser appuser
WORKDIR /app
COPY --from=builder --chown=appuser:appuser /app/target/*.jar app.jar
COPY --chown=appuser:appuser wait-for-it.sh .
RUN chmod +x wait-for-it.sh

USER appuser
EXPOSE 8082

CMD ["./wait-for-it.sh", "postgres:5432", "--", "java", "-jar", "app.jar"]
