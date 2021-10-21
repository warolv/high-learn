FROM ruby:3.0.1

RUN apt-get update -qq \
&& apt-get install -y nodejs postgresql-client

ENV RAILS_ROOT /app

ADD . /app

WORKDIR /app

RUN bundle install

EXPOSE 3000

CMD ["bash"]