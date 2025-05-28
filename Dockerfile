FROM maven:3.9.3-eclipse-temurin-17

WORKDIR /app

# Copiamos archivos para descargar dependencias
COPY pom.xml mvnw ./
COPY .mvn .mvn

# Descargamos dependencias (opcional para cache)
RUN ./mvnw dependency:go-offline

# Copiamos el código fuente completo
COPY ./src ./src

# Exponemos el puerto que usa Spring Boot
EXPOSE 8080

# Comando para iniciar la app en modo desarrollo (hot reload)
CMD ["./mvnw", "spring-boot:run"]
