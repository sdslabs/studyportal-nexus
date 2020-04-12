FROM python:3.7-stretch

ENV PYTHONBUFFERED 1

RUN apt-get update \
    && apt-get install libexempi3 \
    && mkdir /cccatalog-api \
    && mkdir -p /var/log/studyportal.log

WORKDIR /studyportal-nexus

# Install Python dependency management tools
RUN pip install --upgrade pip \
    && pip install --upgrade setuptools \
    && pip install --upgrade pipenv

# Copy the requirements.txt into the container
COPY requirements.txt /studyportal-nexus/

# Install the dependencies system-wide
# TODO: Use build args to avoid installing dev dependencies in production
RUN pip install -r requirements.txt

ENTRYPOINT ["./run.sh"]
