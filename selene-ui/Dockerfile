FROM ubuntu:18.04 as build

# https://github.com/MycroftAI/selene-ui

RUN apt-get update
RUN apt-get install -y npm git curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

RUN npm install -g @angular/cli

WORKDIR /usr/src/app
RUN git clone https://github.com/MycroftAI/selene-ui.git
WORKDIR selene-ui
RUN npm --version
RUN npm cache clean --forc
RUN rm package-lock.json
#RUN npm install --only=prod
RUN npm install
WORKDIR projects
RUN ng build --project shared
RUN ng build --project globalnav
RUN ng build --project account --prod
RUN ng build --project market --prod
RUN ng build --project sso --prod

FROM nginx:latest

RUN apt-get update && apt-get install -y curl dnsutils
ARG application_name

COPY --from=build /usr/src/app/selene-ui/dist/${application_name}/ /usr/share/nginx/html

# Setup reverse proxy for various apis.
RUN rm -rf /etc/nginx/conf.d/default.conf
ADD reverse-proxy.conf /etc/nginx/conf.d/reverse-proxy.conf

#CMD nginx-debug -g 'daemon off;'
