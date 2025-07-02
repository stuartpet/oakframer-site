FROM ruby:3.2.2

# Install dependencies
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
  && apt-get install -y nodejs yarn postgresql-client build-essential libpq-dev

# Set environment
ENV RAILS_ENV=production
ENV BUNDLE_PATH=/gems

# Create app dir
WORKDIR /app

# Install Ruby gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.4.10
RUN bundle install --without development test

# Install JS dependencies
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# Add rest of app
COPY . .

# Precompile assets
RUN bundle exec rails assets:precompile

# Run app
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
