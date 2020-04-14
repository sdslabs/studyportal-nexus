#!/bin/bash
NEXUS_CONTAINER_NAME="${NEXUS_CONTAINER_NAME:-studyportal-nexus}"
POSTGRES_CONTAINER_NAME="${POSTGRES_CONTAINER_NAME:-studyportal-nexus_db_1}"
# Set up API database
docker exec -ti $NEXUS_CONTAINER_NAME /bin/bash -c 'python3 manage.py migrate --noinput'
# Create a user for testing.
docker exec -i $NEXUS_CONTAINER_NAME /bin/bash <<'EOF'
python3 manage.py shell -c "from django.contrib.auth.models import User
user = User.objects.create_user('studyportal', 'test@test.test', 'studyportal')
user.save()
"
EOF
# Create database
docker exec -ti $POSTGRES_CONTAINER_NAME /bin/bash -c 'PGPASSWORD=studyportal createdb -h localhost -U studyportal studyportal'
# Ingest mock data
PGPASSWORD=studyportal psql -h localhost -d studyportal -U studyportal < dump.sql
# Rebuild indexes
docker exec -ti $NEXUS_CONTAINER_NAME /bin/bash -c 'python3 manage.py search_index --rebuild -f'
