#!/bin/bash
NEXUS_CONTAINER_NAME="${NEXUS_CONTAINER_NAME:-study-backend-dev}"
POSTGRES_CONTAINER_NAME="${POSTGRES_CONTAINER_NAME:-study-db}"
# Set up API database
docker exec -ti $NEXUS_CONTAINER_NAME /bin/bash -c 'python3 manage.py migrate --noinput'
# Create a user for testing.
docker exec -i $NEXUS_CONTAINER_NAME /bin/bash <<'EOF'
python3 manage.py shell -c "from django.contrib.auth.models import User
user = User.objects.create_user('studyportal', 'test@test.test', 'studyportal', is_staff=True, is_superuser=True)
user.save()
"
EOF
# Create database
docker exec $POSTGRES_CONTAINER_NAME /bin/bash -c 'PGPASSWORD=studyportal createdb -h localhost -U studyportal studyportal'
# Ingest mock data
docker exec $NEXUS_CONTAINER_NAME /bin/bash -c 'python3 data.py'
# Rebuild indexes
docker exec $NEXUS_CONTAINER_NAME /bin/bash -c 'python3 manage.py search_index --rebuild -f'
