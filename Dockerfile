FROM python:3.13-slim

# Ensure that Python output is sent straight to the terminal (useful for debugging)
ENV PYTHONUNBUFFERED 1

# Create a working directory and copy the Django project into it
RUN mkdir /djangopg
WORKDIR /djangopg
COPY  ./djangopg /djangopg

# Update the package list
RUN apt-get update

# Upgrade pip and install database dependencies
RUN pip install --upgrade pip \
	&& pip install -U psycopg2-binary

# Copy and install Python dependencies
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
