FROM ruby:3.2
ARG RUBYGEMS_VERSION=3.4.8
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs vim
RUN mkdir /papatomo
WORKDIR /papatomo
ADD Gemfile /papatomo/Gemfile
ADD Gemfile.lock /papatomo/Gemfile.lock
RUN gem update --system ${RUBYGEMS_VERSION} && bundle install
ADD . /papatomo
