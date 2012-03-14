source :rubygems

gem "rails", "3.2.2"
gem "configatron"
gem "mysql2"
gem "cbrunnkvist-psd_logger"
#gem "alter_table", :git => "git+ssh://git@github.com/sanger/alter_table.git"
gem "amqp", "~> 0.9.2"
gem "rails_sql_views"
gem "hashie", "~> 1.2.0"

group :test, :development do
  gem 'rspec-rails', '~> 2.8.0'
end
group :test do
  gem 'database_cleaner'
end

group :development do
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'growl'
end
