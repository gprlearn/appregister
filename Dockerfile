FROM python:3.7-buster

# Make sure the logs are not buffered to the terminal
ENV PYTHON_UNBUFFERED 1

# Make sure pyc files are not written to the disk
ENV PYTHONDONTWRITEBYTECODE 1

# Create a folder for storing sourcecode
# RUN mkdir /code

# Specify a working directory relative to the current folder. MUST be specified
# WORKDIR /code

# Get the python libs for the project
COPY requirements.txt /
RUN pip install -r requirements.txt

COPY ./entrypoint.sh /entrypoint.sh

# Include source code in the image
COPY . /

#RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
