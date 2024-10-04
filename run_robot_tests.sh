#!/bin/bash

echo "Running tests"

# käynnistetään Flask-palvelin taustalle
poetry run flask run &

echo "started Flask server"

# odetetaan, että palvelin on valmiina ottamaan vastaan pyyntöjä
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:5000/ping)" != "200" ]];
  do sleep 1;
done

echo "Flask server is ready"

# suoritetaan testit
poetry run robot tests

status=$?

# pysäytetään Flask-palvelin portissa 5000
kill $(lsof -t -i:5000)

exit $status