source 'https://www.rubygems.org'

gem "rails", "3.2.22.2"
gem "mysql2","~> 0.3.10"
gem "amqp", "~> 0.9.2"
gem "hashie", "~> 1.2.0"
gem "rest-client"

# We have to use composite primary keys because of the table partitioning
gem "composite_primary_keys", "~> 5.0.10"
gem "activerecord-triggers", :git => "git+ssh://git@github.com/sanger/activerecord-triggers.git"

group :test, :development do
  gem 'rspec-rails', '~> 2.8.0'
  gem 'mocktra', '~> 1.0.2'
end

group :development do
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'growl'
end

group :deployment do
  gem "psd_logger", :git => "git+ssh://git@github.com/sanger/psd_logger.git"
end
