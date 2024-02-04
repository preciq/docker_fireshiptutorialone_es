# Esta línea especifica la imagen base desde la que estamos construyendo. 'node:12' es una imagen con Node.js v12 instalado.
FROM node:12

# Esta línea establece el directorio de trabajo en el contenedor Docker. Todas las siguientes instrucciones en el Dockerfile se ejecutarán en este directorio /app.
WORKDIR /app

# Esta línea copia los archivos package.json y package-lock.json (si están disponibles) de tu sistema local al contenedor Docker. Estos archivos son necesarios para instalar las dependencias de la aplicación Node.js.
COPY package*.json ./

# Esta línea ejecuta el comando 'npm install' que instala todas las dependencias definidas en el archivo package.json.
RUN npm install

# Esta línea copia todo desde el directorio actual en tu sistema local al directorio /app en el contenedor Docker.
COPY . .

# Esta línea establece la variable de entorno PORT en 8080. Esta variable se utiliza generalmente para especificar el puerto en el que se ejecutará la aplicación.
ENV PORT=8080

# Esta línea indica que el contenedor Docker escuchará en el puerto 8080 en tiempo de ejecución. Esto no publica el puerto en el host. Para hacerlo, necesitas usar la opción -p en el comando docker run.
EXPOSE 8080

# Esta línea especifica el comando que se debe ejecutar cuando se inicia el contenedor Docker. En este caso, se inicia la aplicación Node.js con 'npm start'.
CMD [ "npm", "start" ]