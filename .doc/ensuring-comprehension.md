# Testing comprehension

## Containerization

1) Explain the principle of "one application per container." Why is this considered a best practice, and what issues can arise if you run multiple applications inside a single container?

- Why is it best practice ?
  - **Single concern:** each container is responsible for a single application and its dependancies and volume, which allows to limit incompatibilites and conflicts.
    - *Example*:
      - two applications need the same library, but different versions.\
      - or they need to access the same file, which could lead to data loss or corruption.
  - **Scalability:** makes it really easy to reuse a container should you need to, whether for the same cluster or for another project.
    - *Example*:
      - if your nginx container only runs nginx, you can spawn more if your site traffic suddenly increases. This is not possible if you run MariaDB within that same container.
  - **Isolation and ressource management:** each container can be limited in ressources (memory, computing power) to ensure all applications and processes are fairly distributed.
  - **Efficiency**: running a single application per container limits image size, which allows for shorter build and deployment time.

- Issues with multiple application containers
  - Running different apps in the same container might also create conflict within the filesystem, with one app overwriting the output of another.
  - Makes it harder to track and monitor issues, since all the apps will log to the same output.

1) Describe the differences between a stateless and a stateful container. How does this distinction affect your approach to data persistence and backup strategies in production?

2) Discuss how you would minimize the attack surface of a Docker image. What specific steps would you take during image creation to enhance security and efficiency?

3) How do you ensure that the base images you use for your containers are secure and trustworthy? What tools or processes do you employ to scan for vulnerabilities?

4) When managing container logs and monitoring, what strategies or tools do you use to ensure observability across a multi-container deployment? How do you handle log aggregation and alerting?

## Automated Deployment & Dockerized Applications

1) Describe your typical CI/CD pipeline for deploying Dockerized applications. How do you handle image building, testing, and deployment automation?

2) What are the benefits and potential pitfalls of using Docker Compose for orchestrating multi-container applications in development and production environments?

3) How do you manage secrets (such as database passwords or API keys) in your Dockerized deployments to ensure they are not exposed in images or logs?

4) Explain the process and reasoning behind using multi-stage builds in Docker. How does this impact image size, security, and deployment speed?

5) What are some best practices for updating and rolling back containerized applications in production to minimize downtime and risk?

## Database Usage and Setup (MariaDB/WordPress Context)

1) When containerizing a database like MariaDB, what are the key considerations for data persistence, backup, and recovery? How do you ensure data is not lost if a container is destroyed?

2) Describe the process you use to automate the initial setup of a WordPress database and user within a containerized environment. How do you handle idempotency and error handling in this process?

3) How do you monitor the health and performance of your MariaDB instance running in a container? What metrics and tools do you rely on?

4) Discuss the security implications of running database containers as root versus a non-root user. What configuration changes are needed to run MariaDB securely in production?

5) Explain how you would migrate a WordPress site (including its database and media files) from one Dockerized environment to another, ensuring minimal downtime and data integrity.
