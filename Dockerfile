FROM golang:latest
MAINTAINER Gian Carlo Val Ebao <gianebao@gmail.com>

RUN apt-get update && apt-get -y upgrade
ENV MYSQL_ROOT_PASSWORD root
ENV GOOSE_DIR /db

RUN \
 echo "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD" | debconf-set-selections &&\
 echo "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD" | debconf-set-selections &&\
 apt-get -y --no-install-recommends install mysql-server mysql-client redis-server &&\
 apt-get autoclean && apt-get clean && apt-get autoremove

RUN go get bitbucket.org/liamstask/goose/cmd/goose
