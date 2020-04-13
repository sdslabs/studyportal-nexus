# Study Portal

## About

This is the backend API repository for Study Portal intended to be used by Study Portal React Web App and the mobile app.

## Prerequisites

1. Install and start PostgreSQL service.
2. Create a database `studyportal`
3. Setup Arceus and Falcon locally or get a remote instance for development/testing.

## Setup Instructions

Ensure that you have installed [Docker](https://docs.docker.com/install/) (with [Docker Compose](https://docs.docker.com/compose/install/)) and that the [Docker daemon is running](https://docs.docker.com/config/daemon/).

1. Clone the repository

   ```bash
   git@github.com:sdslabs/studyportal-nexus.git
   ```

2. Setup and start docker containers

    ```bash
    docker-compose up
    ```

After executing `docker-compose up`, you will be running:

* A Django API server
* One PostgreSQL instance (serves as the application database)
* Elasticsearch

Once everything has initialized, with `docker-compose` still running in the background, load the sample data. You will need to install PostgreSQL client tools to perform this step. On Debian, the package is called `postgresql-client-common`.

```bash
./ingest.sh
```

You are now ready to start sending the API server requests. Hit the API with a request to make sure it is working:
`curl localhost:8005/api/v1/courses`

### Diagnosing local Elasticsearch issues

If the API server container failed to start, there's a good chance that Elasticsearch failed to start on your machine. Ensure that you have allocated enough memory to Docker applications, otherwise the container will instantly exit with an error. Also, if the logs mention "insufficient max map count", increase the number of open files allowed on your system. For most Linux machines, you can fix this by adding the following line to `/etc/sysctl.conf`:

```bash
vm.max_map_count=262144
```

To make this setting take effect, run:

```bash
sudo sysctl -p
```
