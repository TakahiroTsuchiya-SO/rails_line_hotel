FROM ruby:2.7
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

ENV HOME="/app"

WORKDIR $HOME

COPY Gemfile $HOME/Gemfile
COPY Gemfile.lock $HOME/Gemfile.lock

RUN apt-get update && \
    bundle install

RUN apt-get install apt-transport-https
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

ADD . $HOME

CMD ["rails", "server", "-b", "0.0.0.0"]