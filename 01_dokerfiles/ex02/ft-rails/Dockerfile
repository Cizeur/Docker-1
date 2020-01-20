FROM ruby:2.6.5

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y build-essential git nodejs

RUN apt-get install -y     nodejs 
RUN apt-get install -y     sqlite3 libsqlite3-dev libgmp3-dev
#RUN apt-get install -y     mysql-server libmysqlclient-dev
RUN apt-get install -y     mariadb-server libmariadb-dev-compat 
RUN apt-get install -y     postgresql postgresql-client postgresql-contrib libpq-dev 
RUN apt-get install -y     redis-server memcached imagemagick mupdf mupdf-tools 
#RUN apt-get install -y ruby-rails
#Installing yarn
RUN curl -o- -L https://yarnpkg.com/install.sh | bash
ENV PATH="/root/.yarn/bin:/root/.config/yarn/global/node_modules/.bin:$PATH"
RUN gem install rails

ONBUILD COPY app /opt/app
ONBUILD WORKDIR /opt/app
ONBUILD RUN bundle install
#create db
ONBUILD RUN rake db:create
#manage table migrations
ONBUILD RUN rake db:migrate
#seed the database
ONBUILD RUN rake db:seed


#BUILD COMMAND
#docker build -t ft-rails .
#to create an app
#docker run -it -v $(pwd):/home ft-rails  /bin/bash
#Tag for next image
#docker tag ft-rails ft-rails:on-build
