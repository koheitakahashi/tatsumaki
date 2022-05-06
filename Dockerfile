FROM ruby:3.1.1

ENV TZ Asia/Tokyo

WORKDIR /app
RUN bundle config set path vendor/bundle
