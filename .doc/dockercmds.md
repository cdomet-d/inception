### Images

- **List images:**
  ```
  docker image ls
  ```
  or the shorthand:
  ```
  docker images
  ```
  You can filter, format, or show all images using options like `-a`, `--filter`, and `--format` [docker image ls](https://docs.docker.com/reference/cli/docker/image/ls/).

- **Remove unused images:**
  ```
  docker image prune
  ```
  To remove all unused images (not just dangling ones):
  ```
  docker image prune -a
  ```
  [Prune unused Docker objects](https://docs.docker.com/engine/manage-resources/pruning/)

---

### Containers

- **List running containers:**
  ```
  docker container ls
  ```
  or the shorthand:
  ```
  docker ps
  ```

- **List all containers (including stopped):**
  ```
  docker container ls -a
  ```
  or:
  ```
  docker ps -a
  ```

- **Remove all stopped containers:**
  ```
  docker container prune
  ```
  [Prune unused Docker objects](https://docs.docker.com/engine/manage-resources/pruning/)

---

### Volumes

- **List volumes:**
  ```
  docker volume ls
  ```
  [docker volume ls](https://docs.docker.com/reference/cli/docker/volume/ls/)

- **Remove unused volumes:**
  ```
  docker volume prune
  ```
  [Prune unused Docker objects](https://docs.docker.com/engine/manage-resources/pruning/)

- **Remove a specific volume:**
  ```
  docker volume rm <volume-name-or-id>
  ```
  [Create and manage volumes](https://docs.docker.com/engine/storage/volumes/#create-and-manage-volumes)

---

These commands cover the most common tasks for listing and maintaining Docker images, containers, and volumes. For more advanced filtering and formatting, refer to the `--filter` and `--format` options in the respective command documentation.