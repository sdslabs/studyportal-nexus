#!/bin/bash

set -e

while [[ "$(curl --insecure -s -o /dev/null -w '%{http_code}' http://study-es:9200/)" != "200" ]]
do
  echo "Waiting for Elasticsearch connection..."
  sleep 2
done

echo "Collect static files"
python manage.py collectstatic --noinput

echo "Apply migration"
python manage.py makemigrations
python manage.py migrate

echo "Rebuild elasticsearch index"
python manage.py search_index --rebuild -f
gunicorn studyportal.wsgi:application --bind 0.0.0.0:8005 --workers 3 --log-file=-
