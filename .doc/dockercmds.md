# DockerCmd CheatSheet

## Manage images, containers & volumes

### Images

- **List images:**

  ```sh
  docker image ls
  # or
  docker images
  ```

You can filter, format, or show all images using options like `-a`, `--filter`, and `--format`

- **Remove unused images (dangling):**

  ```sh
  docker image prune
  #  or remove all unused images (not just dangling ones):
  docker image prune -a
  ```

- **Remove all images:**

  ```sh
  docker rmi $(docker images -q)
  ```

### Containers

- **List running containers:**

  ```sh
  docker container ls
  # or
  docker ps
  ```

- **List all containers (including stopped):**

  ```sh
  docker container ls -a
  # or:
  docker ps -a
  ```

- **Remove all stopped containers:**

  ```sh
  docker container prune
  ```

- **Stop and remove all containers:**

  ```sh
  docker stop $(docker ps -aq) && docker rm $(docker ps -aq)```
  ```

- **Remove everything unused at once:**

  ```sh
  docker system prune -a --volumes
  ```

### Volumes

- **List volumes:**

  ```sh
  docker volume ls
  ```

- **Remove unused volumes:**

  ```sh
  docker volume prune
  ```

- **Remove a specific volume:**

  ```sh
  docker volume rm <volume-name-or-id>
  ```

  - **Remove all volumes:**

  ```sh
  docker volume rm $(docker volume ls -q)
  ```

## Building and composing

Here are some common Docker commands used to build images and compose multi-container applications:

## Building Images

- **docker build**
  Builds a Docker image from a Dockerfile and a build context (the directory containing the Dockerfile and any files it needs).

  ```sh
  docker build .
  ```

  This command builds an image using the Dockerfile in the current directory. You can also tag the image:

  ```sh
  docker build -t my-image:latest .
  ```

## Composing Images and Services

- **docker compose up** builds, (re)creates, starts, and attaches to containers for a service as defined in a `compose.yaml` file.

  ```sh
  docker compose up
  ```

  Add `-d` to run in detached mode:

  ```sh
  docker compose up -d
  ```

- **docker compose build** builds or rebuilds services defined in the Compose file.

  ```sh
  docker compose build
  ```

  To build a specific service:

  ```sh
  docker compose build servicename
  ```

  You can use options like `--no-cache` to avoid using cache, or `--pull` to always pull the latest base images:

  ```sh
  docker compose build --no-cache
  docker compose build --pull
  ```

- **docker compose down** stops and removes containers, networks, and other resources created by `up`.

  ```sh
  docker compose down
  ```

- **docker compose ps** lists the containers and their status for the current Compose project.

  ```sh
  docker compose ps
  ```

- **docker compose logs** shows logs from containers managed by Compose.

  ```sh
  docker compose logs
  ```

## Sources

- [How Compose works: CLI](https://docs.docker.com/compose/intro/compose-application-model/#cli)

These commands are the foundation for building images and orchestrating multi-container applications with Docker Compose. For more advanced options and subcommands, see the [Compose CLI reference](https://docs.docker.com/reference/cli/docker/compose/#subcommands).
