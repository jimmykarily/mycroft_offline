FROM ubuntu:18.04

# https://github.com/MycroftAI/selene-backend

RUN apt-get update
RUN apt-get install -y python3.7 python python3-pip git wget python3.7-dev

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

RUN bash -c 'export LANG=en; cd /opt/selene/selene-backend/api; for dir in sso account market public; do pushd $dir; pipenv install; popd; done'

RUN mkdir -p /var/log/mycroft

# https://github.com/MycroftAI/selene-backend/issues/201
RUN mkdir -p /opt/selene/documentation/_pages && \
  cd /opt/selene/documentation/_pages && \
  printf "%s\n%s\n" '---' '---' > embed-privacy-policy.md && \
  printf "%s\n%s\n" '---' '---' > embed-terms-of-use.md
