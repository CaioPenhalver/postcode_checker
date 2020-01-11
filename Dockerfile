FROM ruby:2.7
MAINTAINER Caio <penhalvercaio@gmail.com>

RUN apt-get update -qq \
      && apt-get install -y --force-yes --no-install-recommends libc6 libstdc++6 unixodbc-dev \
      && apt-get install -y --no-install-recommends vim locales \
      && apt-get install -y --no-install-recommends postgresql-client \
      && rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
RUN export LC_ALL="en_US.utf8"

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p /postcode_checker

WORKDIR /postcode_checker
COPY Gemfile Gemfile.lock ./
RUN bundle install
RUN gem install bundler-audit

WORKDIR /postcode_checker
ADD . /postcode_checker

