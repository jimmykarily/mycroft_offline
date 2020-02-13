This project is a collection of files which helps you deploy a full instance of [mycroft](https://mycroft.ai/) (both backend and frontend).

## Goal

Deploy a home assistant offline as easy as possible.

## Why

There are various home assistant solutions out there but all of them transfer your voice to some server for processing. This is a no-go for many people although the technology is interesting and could be useful. There are various open source tools to achieve the same result but there is no turn-key open source self hosted solution. The goal of this project is to implement a way to have a home assistant running locally - ideally with one command.

The project that is closer to the desired result is Mycroft (https://mycroft.ai/). It is very easy to run the client side components using one docker command but their backend is running remotely. All the tools they use though are open source so it only needs one to do the work and package them in a nice little docker-compose file (https://mycroft-ai.gitbook.io/docs/about-mycroft-ai/faq#can-mycroft-run-completely-offline-can-i-self-host-everything).

## Prerequisites

- yq tool: https://github.com/mikefarah/yq/releases (to parse yaml configuration)
- docker: https://www.docker.com/get-started
- docker-compose: https://docs.docker.com/compose/
- Internet connection to download docker images and dependencies

## Build needed images

Build the front-end application images:

```
$ pushd selene-ui
$ for app in account sso market; do docker build --build-arg application_name=${app} -t selene-ui-${app} . ; done
$ popd
```

build the selene-backend image:

```
$ pushd selene-backend
$ docker build -t selene-backend .
$ popd
```

## Deploy

Start by copying `mycroft.yaml.sample` to `mycroft.yaml`. Then edit the values as needed.

Then run:

```
$ make backend
```

To cleanup run:

```
$ make clean-backend
```

## Note

This project started as part of SUSE Hackweek 19: https://hackweek.suse.com/projects/home-assistant-that-doesnt-spy-on-you-developers-edition

Idea: Create a mycroft skill to deploy apps with CF (cf cli wrapper)

## Links

- https://mycroft.ai/
- https://mycroft.ai/initiatives/
- https://fosspost.org/lists/open-source-speech-recognition-speech-to-text
- https://mycroft-ai.gitbook.io/docs/about-mycroft-ai/faq#can-mycroft-run-completely-offline-can-i-self-host-everything
- https://mycroft-ai.gitbook.io/docs/using-mycroft-ai/customizations/stt-engine
- https://github.com/MycroftAI/selene-backend/issues/203
