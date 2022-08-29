# 2020
# Import your ruby version
FROM ruby:2.7.1

COPY . .
# Install bundler gem
RUN gem install bundler

ENV FILE_LOCATION=/host/README.md
# Assign a work directory
ENTRYPOINT ./mdtoc.rb ${FILE_LOCATION}