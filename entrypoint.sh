#!/bin/sh
python manage.py makemigrations
python manage.py migrate_schemas
python manage.py collectstatic --no-input --clear
exec "$@"
