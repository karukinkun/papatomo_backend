FROM ruby:3.2
ARG APPNAME
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs vim
RUN mkdir /${APPNAME}
WORKDIR /${APPNAME}
ADD Gemfile /${APPNAME}/Gemfile
ADD Gemfile.lock /${APPNAME}/Gemfile.lock
RUN bundle install
ADD . /${APPNAME}