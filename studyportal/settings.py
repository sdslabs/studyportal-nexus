"""
Django settings for studyportal project.

Generated by 'django-admin startproject' using Django 2.2.

For more information on this file, see
https://docs.djangoproject.com/en/2.2/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/2.2/ref/settings/
"""

import os
import yaml
from pathlib import Path

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
CUR_DIR = os.path.dirname(os.path.abspath(__file__))
BASE_DIR = os.path.dirname(CUR_DIR)

# Load Database config using yaml conf file
yamlFilePath = CUR_DIR + "/config/postgresql.yml"
try:
    confFile = open(yamlFilePath, "r")
except FileNotFoundError:
    print("The required config file " + yamlFilePath + " does not exist")
    exit(1)
DB_PARAMS = yaml.safe_load(confFile)

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = "s-0n5h@4*e((tj3ll%8v=)9t$*24t*mdx6tyt&4+5k-l3x)pl="

NEXUS_URL = "http://localhost:8005/api/v1"

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = (os.environ.get("DEVELOPMENT_MODE") == "True")

ALLOWED_HOSTS = []
if DEBUG:
      ALLOWED_HOSTS.append("*")

# Application definition

INSTALLED_APPS = [
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    "rest_framework",
    "corsheaders",
    "django_elasticsearch_dsl",
    "channels",
    "resources",
    "users",
    "admin_panel",
]

MIDDLEWARE = [
    "corsheaders.middleware.CorsMiddleware",
    "django.middleware.security.SecurityMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
]

ROOT_URLCONF = "studyportal.urls"

CORS_ORIGIN_WHITELIST = (
    "https://study.sdslabs.co",
    "http://10.25.1.18:3005",
    "http://localhost:3005",
    "https://10.25.1.18:3005",
    "https://localhost:3005",
    "http://0.0.0.0:3005"
)

if DEBUG:
      whitelist = list(CORS_ORIGIN_WHITELIST)
      whitelist.append("http://studyportal.sdslabs.local")
      whitelist.append("http://localhost:3005")
      whitelist.append("http://127.0.0.1:3005")
      whitelist.append("https://localhost:3005")
      whitelist.append("https://127.0.0.1:3005")
      whitelist.append("http://0.0.0.0:3005")
      CORS_ORIGIN_ALLOW_ALL = True
      CORS_ORIGIN_WHITELIST = tuple(whitelist)
      print("bhendalund0")

CORS_ALLOW_CREDENTIALS = True

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [],
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
            ],
        },
    },
]

WSGI_APPLICATION = "studyportal.wsgi.application"
ASGI_APPLICATION = "studyportal.routing.application"

REDIS_HOST = os.environ.get("REDIS_HOST")
REDIS_PORT = os.environ.get("REDIS_PORT")

CHANNEL_LAYERS = {
    "default": {
        "BACKEND": "channels_redis.core.RedisChannelLayer",
        "CONFIG": {
            "hosts": [(REDIS_HOST, REDIS_PORT)],
        },
    },
}

ELASTICSEARCH_HOST = os.environ.get("ELASTICSEARCH_HOST")
ELASTICSEARCH_PORT = os.environ.get("ELASTICSEARCH_PORT")

ELASTICSEARCH_DSL = {
  "default": {
    "hosts": "{}:{}".format(ELASTICSEARCH_HOST, ELASTICSEARCH_PORT)
    }
}



# Database
# https://docs.djangoproject.com/en/2.2/ref/settings/#databases

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql",
        "NAME": os.environ.get("DATABASE_NAME") if os.environ.get("DATABASE_NAME") else DB_PARAMS["NAME"],
        "USER": os.environ.get("DATABASE_USER") if os.environ.get("DATABASE_USER") else DB_PARAMS["USER"],
        "PASSWORD": os.environ.get("DATABASE_PASSWORD") if os.environ.get("DATABASE_PASSWORD") else DB_PARAMS["PASSWORD"],
        "HOST": os.environ.get("DATABASE_HOST") if os.environ.get("DATABASE_HOST") else DB_PARAMS["HOST"],
        "PORT": os.environ.get("DATABASE_PORT") if os.environ.get("DATABASE_PORT") else DB_PARAMS["PORT"],
    }
}


# Password validation
# https://docs.djangoproject.com/en/2.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        "NAME": "django.contrib.auth.password_validation.UserAttributeSimilarityValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.MinimumLengthValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.CommonPasswordValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.NumericPasswordValidator",
    },
]


# Internationalization
# https://docs.djangoproject.com/en/2.2/topics/i18n/

LANGUAGE_CODE = "en-us"

TIME_ZONE = "UTC"

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.2/howto/static-files/

STATIC_ROOT = os.path.join(BASE_DIR, 'static')
STATIC_URL = "/static/"

MEDIA_ROOT = os.path.join(BASE_DIR, "media")
MEDIA_URL = "/media/"


# Load Auth0 application settings into memory
AUTH0_DOMAIN = os.environ.get("AUTH0_DOMAIN")
AUTH0_CLIENT_ID = os.environ.get("AUTH0_CLIENT_ID")
AUTH0_CLIENT_SECRET = os.environ.get("AUTH0_CLIENT_SECRET")
