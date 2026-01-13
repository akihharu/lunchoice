FROM ruby:3.3.0-slim

# Rails app lives here
WORKDIR /app

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  npm \
  yarn \
  libvips \
  libvips-dev

ENV RAILS_ENV="development" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3

COPY Gemfile Gemfile.lock /app/
RUN bundle install

CMD ["bash"]