# django_postgres_docker

This repository contains the code from our blog post [How to Connect Django and Postgres Using Docker and Docker Compose](https://rhonidev.com/blog/how-to-connect-django-and-postgres-using-docker-and-docker-compose).

It's a simple setup meant to help you get started with containerizing a Django project and linking it to a Postgres database. We walk through:

- Creating a base Django project
- Writing a Dockerfile for the Django app
- Adding a Postgres service
- Managing containers with docker compose
- Running migrations and checking that everything works

If you're new to Docker or just want a reference for Django + Postgres, we hope this project helps you!

Feel free to clone it, explore, and adapt it to your own needs. And if you have questions or suggestions, don’t hesitate to reach out.


## How to run this project

1. Clone the repository

2. Create an `.env` file and add the following:

```
POSTGRES_DB="postgres_db"
POSTGRES_USER="your_user"
POSTGRES_PASSWORD="your_password"
PG_HOST="postgres_db"
PG_PORT="5432"
```

3. Run `docker compose build`

4. Run `docker compose up -d` to start the containers in detached mode

5. Perform Django migrations

```bash
docker exec djangopg python manage.py migrate
```

6. Check that everything is working as expected by taking a look to the tables in the database.

First, open a shell to the Postgres container:

```bash
docker exec -it postgres_db sh
```

Then, check that the tables have been created in the database:

```bash
psql -U your_user_name -d postgres_db

\dt
```




