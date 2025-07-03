FROM ruby:3.2.2

# Install Node.js and dependencies
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
  && apt-get install -y nodejs postgresql-client build-essential libpq-dev curl git \
  && npm install -g yarn

# Set environment
ENV RAILS_ENV=production
ENV NODE_ENV=production
ENV BUNDLE_PATH=/gems

WORKDIR /app

# Install Ruby gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.4.10
RUN bundle install --without development test

# Install JS deps
COPY package.json yarn.lock ./
RUN yarn install

# Copy app files, including precompiled assets
COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
