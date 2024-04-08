FROM ruby:3.1-alpine

RUN adduser -D -s /sbin/nologin app

WORKDIR /home/app

COPY --chown=app:app . /home/app

RUN set -ex \
  && apk add g++ gcc make cmake \
  && gem install bundler \
  && bundle install

USER app

CMD ["tail", "-f", "/dev/null"]
