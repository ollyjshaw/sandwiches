FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
RUN gem install bundler
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
RUN /myapp/bin/rails db:drop db:setup db:migrate db:seed
EXPOSE 80
CMD ["/myapp/bin/rails", "s", "-p", "80"]
