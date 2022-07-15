FROM ruby:2.6.3

RUN apt-get update -qq && \
  apt-get install -y build-essential \
  nodejs

WORKDIR /rakukin

COPY Gemfile /rakukin/Gemfile
COPY Gemfile.lock /rakukin/Gemfile.lock

RUN gem install bundler
RUN bundle install

RUN mkdir -p tmp/sockets
ENV TZ Asia/Tokyo