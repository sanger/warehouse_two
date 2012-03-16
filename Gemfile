source :rubygems

gem "rails", "3.2.2"
gem "mysql2"
gem "cbrunnkvist-psd_logger"
gem "amqp", "~> 0.9.2"
gem "hashie", "~> 1.2.0"

# Need a branched verion of the rails_sql_views gem to support MySQL2 and ActiveRecord 3, but that is
# fixed against a specific version of Rake, which is actually a downgrade for Rails 3.2.
gem "rails_sql_views", :git => "git+ssh://git@github.com/anathematic/rails_sql_views.git"
gem "rake", "= 0.9.2"

group :test, :development do
  gem 'rspec-rails', '~> 2.8.0'
end

group :development do
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'growl'
end
