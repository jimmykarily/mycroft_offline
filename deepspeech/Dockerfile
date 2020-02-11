FROM ubuntu:18.04

# https://pypi.org/project/deepspeech-server/

RUN apt-get update
RUN apt-get install -y python3.7 python python3-pip git wget python3.7-dev

RUN pip3 install deepspeech
RUN pip3 install deepspeech-server
RUN wget https://github.com/mozilla/DeepSpeech/releases/download/v0.6.1/deepspeech-0.6.1-models.tar.gz
RUN tar xvfz deepspeech-0.6.1-models.tar.gz
WORKDIR deepspeech-0.6.1-models

RUN wget -O config.json https://raw.githubusercontent.com/MainRo/deepspeech-server/master/config.sample.json

CMD ["deepspeech-server", "--config", "config.json"]
