FROM ruby:2.4.0-alpine

EXPOSE 8080 
WORKDIR /opt

RUN apk update # && apk upgrade
RUN apk add git # ruby-json ruby-dev alpine-sdk

RUN git init
RUN git config core.sparseCheckout true
RUN echo "dist/*" >> .git/info/sparse-checkout

RUN git remote add origin https://github.com/swagger-api/swagger-editor.git 
RUN git fetch --depth 1 origin tag v/3.6.5
RUN git pull origin v/3.6.5

# Add our custom index.html for automatic loading/saving
ADD Gemfile /opt/Gemfile
RUN bundle install && bundle clean

ADD index.html /opt/index.html
ADD server.rb /opt/server.rb


CMD ruby /opt/server.rb

