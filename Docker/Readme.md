# 🐳 Docker Essentials for Node.js Projects

This guide provides essential Docker commands for building, running, and managing containers — ideal for beginners working with Node.js or any containerized app.



## 📦 1. Build Docker Image

Build the Docker image from a `Dockerfile` in your current directory:

```bash
docker build -t your-image-name .
````

Use `--no-cache` to force rebuild:

```bash
docker build --no-cache -t your-image-name .
```



## 2. Run Docker Container

### Run and Map Ports

```bash
docker run -p 3000:3000 your-image-name
```

### Run in Interactive Mode (terminal)

```bash
docker run -it your-image-name
```



## 3. Container Logs and Shell

### View Logs

```bash
docker logs container-id
```

### Open a Shell in a Running Container

```bash
docker exec -it container-id bash
```



## 4. List & Manage Containers

### List Running Containers

```bash
docker ps
```

### List All Containers (including stopped)

```bash
docker ps -a
```

### Stop a Running Container

```bash
docker stop container-id
```

### Remove a Container

```bash
docker rm container-id
```



## 5. Image Management

### List Docker Images

```bash
docker images
```

### Remove an Image

```bash
docker rmi image-id
```



## 6. Clean Up

### Remove All Stopped Containers

```bash
docker container prune
```

### Remove Unused Images

```bash
docker image prune -a
```



## 7. Push to Docker Hub

### Tag Image for Docker Hub

```bash
docker tag your-image yourusername/your-image
```

### Push to Docker Hub

```bash
docker push yourusername/your-image
```



## 8. Sample Docker Workflow (Node.js App)

### `Dockerfile`

```Dockerfile
FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
```

### Build and Run

```bash
docker build -t my-node-app .
docker run -p 3000:3000 my-node-app
```

## 9. Container Networking: Making Containers Talk to Each Other

To allow containers to communicate, attach them to the same network.

### Steps:

1.  **Create a network:**
    ```bash
    docker network create my_custom_network
    ```

2.  **Start the backend process with the network attached to it:**
    ```bash
    docker run -d -p 3000:3000 --name backend --network my_custom_network image_tag
    ```
    *(Note: Replace `image_tag` with the actual tag you used in step 2 or your application's image name)*

3.  **Start Mongo (or any other service) on the same network:**
    ```bash
    docker run -d -v volume_database:/data/db --name mongo --network my_custom_network mongo
    ```

4.  **Check the logs to ensure the DB connection is successful:**
    ```bash
    docker logs <container_id>
    ```
    *(Replace `<container_id>` with the actual ID or name of your backend container, e.g., `backend`)*

7.  **Try to visit an endpoint and ensure you are able to talk to the database.**

8.  **Optional:** You can remove the port mapping for Mongo since you don't necessarily need it exposed on your machine if only your backend container needs to access it.



