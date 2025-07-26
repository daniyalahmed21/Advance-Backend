# 🐳 Docker Essentials for Node.js Projects

This guide provides essential Docker commands for building, running, and managing containers — ideal for beginners working with Node.js or any containerized app.

---

## 📦 1. Build Docker Image

Build the Docker image from a `Dockerfile` in your current directory:

```bash
docker build -t your-image-name .
````

Use `--no-cache` to force rebuild:

```bash
docker build --no-cache -t your-image-name .
```

---

## 2. Run Docker Container

### Run and Map Ports

```bash
docker run -p 3000:3000 your-image-name
```

### Run in Interactive Mode (terminal)

```bash
docker run -it your-image-name
```

---

## 3. Container Logs and Shell

### View Logs

```bash
docker logs container-id
```

### Open a Shell in a Running Container

```bash
docker exec -it container-id bash
```

---

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

---

## 5. Image Management

### List Docker Images

```bash
docker images
```

### Remove an Image

```bash
docker rmi image-id
```

---

## 6. Clean Up

### Remove All Stopped Containers

```bash
docker container prune
```

### Remove Unused Images

```bash
docker image prune -a
```

---

## 7. Push to Docker Hub

### Tag Image for Docker Hub

```bash
docker tag your-image yourusername/your-image
```

### Push to Docker Hub

```bash
docker push yourusername/your-image
```

---

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

---

## Quick Cheatsheet

| Task                  | Command                             |
| --------------------- | ----------------------------------- |
| Build Image           | `docker build -t name .`            |
| Run Container         | `docker run -p 3000:3000 name`      |
| List Images           | `docker images`                     |
| List Containers       | `docker ps -a`                      |
| Remove Container      | `docker rm container-id`            |
| Enter Container Shell | `docker exec -it container-id bash` |

---



