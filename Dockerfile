FROM ruby:2.6.6

RUN  apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
  postgresql-client vim nodejs \
  && rm -rf /var/lib/apt/lists

ENV BUNDLE_PATH /gems
ENV APP_NAME hertsjazzclub
ENV APP_PATH /usr/src/app
ENV PATH $APP_PATH/bin:$PATH
ENV RAILS_ENV development

WORKDIR $APP_PATH

ADD . $APP_PATH

RUN  bundle check || bundle install

EXPOSE 3308
CMD ./lib/docker-entrypoint.sh