# Study Portal

# About

This is the backend API repository for Study Portal intended to be used by Study Portal React Web App and the mobile app.

# Prerequisites

1. Install [PostgreSQL service](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04).
1. Obtain a credentials.json from the author/generate one yourself and place it in `studyportal/drive`.
1. Create a `.env` file from `.env.sample` and change the fields as appropriate.

## Optional Prerequisites:
> These are required to get the auth running for development setup.

1. Setup Arceus and Falcon locally or get a remote instance for development/testing.
1. Register study as an app in Arceus and make changes to `.env`.

If you want to skip these steps you can just add a cookie in the browser with the following description:
```bash
key: token,
value: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6ImRhcmtyaWRlciIsImVtYWlsIjoiZGFya3JpZGVyMjUxMDk5QGdtYWlsLmNvbSJ9.xBwh-abNBZTlxWDRjEs33DN2AjXlf21JkSwlez6dvGM
```

# Setup Instructions

Ensure that you have installed [Docker](https://docs.docker.com/install/) (with [Docker Compose](https://docs.docker.com/compose/install/) ) and that the [Docker daemon is running](https://docs.docker.com/config/daemon/).

1. Clone the repository

```bash
git clone git@github.com:sdslabs/studyportal-nexus.git
```

2. Setup and start docker containers

```bash
docker-compose -f docker-compose-dev.yml up
```

After executing `docker-compose -f docker-compose-dev.yml up`, you will be running:

* A Django API server
* PostgreSQL instance(serves as the application database)
* Elasticsearch instance
* Redis server

Once everything has initialized, with `docker-compose` still running in the background, load the sample data. You will need to install PostgreSQL client tools to perform this step. On Debian, the package is called `postgresql-client-common`.

```bash
./ingest.sh
```

You are now ready to start sending the API server requests. Hit the API with a request to make sure it is working:
`curl localhost:8005/api/v1/departments`

# Diagnosing local Elasticsearch issues

If the API server container failed to start, there's a good chance that Elasticsearch failed to start on your machine. Ensure that you have allocated enough memory to Docker applications, otherwise the container will instantly exit with an error. Also, if the logs mention "insufficient max map count", increase the number of open files allowed on your system. For most Linux machines, you can fix this by adding the following line to `/etc/sysctl.conf`:

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

3. Edit the `.env` file.

```bash
DATABASE_HOST=localhost
ELASTICSEARCH_HOST=localhost
REDIS_HOST=localhost
```

4. Initialize the database and create elasticsearch index

```bash
python manage.py makemigrations
python manage.py migrate
python manage.py search_index --rebuild -f
```

5. Create Django admin user

```bash
python manage.py createsuperuser
```

6. Run development server

```bash
python manage.py runserver 0.0.0.0:8005
```
