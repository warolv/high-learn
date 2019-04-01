FROM ruby:2.4

# Install dependencies
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential libpq-dev nodejs && \
	rm -rf /var/lib/apt/lists/*

# Set the root of your Rails application
ENV RAILS_ROOT /app
RUN mkdir -p $RAILS_ROOT
 
# Set working directory to the root path of the Rails app
WORKDIR $RAILS_ROOT

# Do not install gem documentation
RUN echo 'gem: --no-ri --no-rdoc' > ~/.gemrc

# If we copy the whole app directory, the bundle would install
# everytime an application file changed. Copying the Gemfiles first
# avoids this and installs the bundle only when the Gemfile changed.
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler && \
    bundle install --jobs 20 --retry 5

# Now copy the application code to the application directory
COPY . /app

EXPOSE 3000

# Default command is starting the rails server
CMD ["bin/rails", "s", "-b", "0.0.0.0"]