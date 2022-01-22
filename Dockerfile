FROM ruby:3
 
WORKDIR /app
 
ENV BUNDLE_PATH=/bundle/vendor
 
# Postgres client
RUN apt-get update -qq \
  && apt-get install -y nodejs npm
 
RUN npm install -g yarn
 
RUN gem install bundler
 
EXPOSE 3000
 
ENTRYPOINT ["docker-entrypoint.sh"]
 
CMD "bundle exec rails s -b 0.0.0.0 -p 3000"
