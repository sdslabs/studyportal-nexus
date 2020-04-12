#!/bin/bash

PGPASSWORD=studyportal psql -h localhost -d studyportal -U studyportal < dump.sql

