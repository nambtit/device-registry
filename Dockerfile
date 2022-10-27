FROM python:3.8.3-slim-buster

ENV FLASK_APP=registry

WORKDIR /app

COPY . /app

RUN apt-get update && \
    # Install required packages to build psycopg2 from source (recommended for production).
    apt-get install -y libpq-dev gcc && \
    # Install requirements
    pip3 install -r requirements.txt && \
    # Then delete them after build completed.
    apt-get purge -y gcc && apt-get autoremove -y

RUN mkdir -p -m 777 /var/log/containers/

# Should be run before changing user to nobody
RUN find / -perm /6000 -type f -exec chmod a-s {} \; || true

USER nobody

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]

EXPOSE 5000