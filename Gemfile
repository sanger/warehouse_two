source :rubygems

gem "rails", "3.2.11"
gem "mysql2"
gem "amqp", "~> 0.9.2"
gem "hashie", "~> 1.2.0"
gem "rest-client"

# We have to use composite primary keys because of the table partitioning
gem "composite_primary_keys", "~> 5.0.4"
gem "activerecord-partitioning", :git => "git+ssh://git@github.com/sanger/activerecord-partitioning.git"
gem "activerecord-triggers", :git => "git+ssh://git@github.com/sanger/activerecord-triggers.git"

# Need a branched verion of the rails_sql_views gem to support MySQL2 and ActiveRecord 3.
gem "rails_sql_views", :git => "git+ssh://git@github.com/anathematic/rails_sql_views.git"

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
