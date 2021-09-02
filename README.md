# Study Portal

# About

This is the backend API repository for Study Portal intended to be used by Study Portal React Web App and the mobile app.

# Prerequisites

1. Install [PostgreSQL service](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04).
2. Setup Arceus and Falcon locally or get a remote instance for development / testing.
3. Register study as an app in Arceus and make changes to `studyportal/falcon/config.py`.
4. Obtain a credentials.json from the author/generate one yourself and place it in `studyportal/drive`.

# Setup Instructions

Ensure that you have installed [Docker](https://docs.docker.com/install/) (with [Docker Compose](https://docs.docker.com/compose/install/) ) and that the [Docker daemon is running](https://docs.docker.com/config/daemon/).

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
* One PostgreSQL instance(serves as the application database)
* Elasticsearch

Once everything has initialized, with `docker-compose` still running in the background, load the sample data. You will need to install PostgreSQL client tools to perform this step. On Debian, the package is called `postgresql-client-common`.

```bash
. / ingest.sh
```

You are now ready to start sending the API server requests. Hit the API with a request to make sure it is working:
`curl localhost:8005/api/v1/departments`

# Diagnosing local Elasticsearch issues

If the API server container failed to start, there's a good chance that Elasticsearch failed to start on your machine. Ensure that you have allocated enough memory to Docker applications, otherwise the container will instantly exit with an error. Also, if the logs mention "insufficient max map count", increase the number of open files allowed on your system. For most Linux machines, you can fix this by adding the following line to `/ etc / sysctl.conf`:

```bash
vm.max_map_count = 262144
```

To make this setting take effect, run:

```bash
sudo sysctl -p
```

# Alternate Setup Instructions

You can setup the local dev in a virtualenv:

1. Create a virtualenv using your preferred method.
* Using virtualenv

```bash
virtualenv -p python3 venv
source venv/bin/activate
```

* Using virtualenvwrapper

```bash
mkvirtualenv studyportal
workon studyportal
```

2. Install packages in virtual environment.

```bash
pip install -r requirements.txt
```

3. Edit config file.

Change `host` in `studyportal/config/postgresql.yml` to `localhost` and in `studyportal/settings.py` change the elasticsearch host from `es` to `localhost`.

# DO NOT COMMIT THESE FILE CHANGES.

4. Initialize the database

```bash
python manage.py makemigrations
python manage.py migrate
```

5. Create Django admin user

```bash
python manage.py createsuperuser
```

6. Run production server

```bash
python manage.py runserver
```
