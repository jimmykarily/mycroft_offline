FROM ubuntu:18.04

# https://github.com/MycroftAI/selene-backend

RUN apt-get update
RUN apt-get install -y python3.7 python python3-pip git wget

RUN mkdir -p /opt/selene
WORKDIR /opt/selene
RUN git clone https://github.com/MycroftAI/selene-backend.git

RUN python3.7 -m pip install pipenv
WORKDIR /opt/selene/selene-backend/db
RUN pipenv install

RUN mkdir -p /opt/selene/data
WORKDIR /opt/selene/data
RUN wget http://download.geonames.org/export/dump/countryInfo.txt
RUN wget http://download.geonames.org/export/dump/timeZones.txt
RUN wget http://download.geonames.org/export/dump/admin1CodesASCII.txt
RUN wget http://download.geonames.org/export/dump/cities500.zip
