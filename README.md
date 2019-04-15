# Study Portal

## About

This is the backend API repository for Study Portal intended to be used by Study Portal React Web App and the mobile app.

## Prerequisites

1. Install and start PostgreSQL service.
2. Create a database `studyportal`
3. Setup Arceus and Falcon locally or get a remote instance for development/testing.

## Setup Instructions

1. Clone the repository

   ```bash
   git clone git@github.com:sdslabs/studyportal.git
   ```

2. Create a virtualenv using your preferred method.
   * Using virtualenv
  
   ```bash
   virtualenv venv
   source venv/bin/activate
   ```

    * Using virtualenvwrapper
  
   ```bash
   mkvirtualenv studyportal
   workon studyportal
   ```

3. Install packages in virtual environment.

   ```bash
   pip install -r requirements.txt
   ```

4. Edit config file.

   ```bash
   cd studyportal/config
   cp postgresql.yml.example postgresql.yml
   ```

5. Initialize the database

   ```bash
   python manage.py makemigrations
   python manage.py migrate
   ```