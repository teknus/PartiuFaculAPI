FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y git build-essential libpq-dev nodejs sqlite3
RUN git clone https://github.com/teknus/PartiuFaculAPI
RUN cd PartiuFaculAPI && bundle install && bundle exec rails db:migrate && bundle exec rake db:seed && bundle exec rails test
COPY Gemfile PartiuFaculAPI