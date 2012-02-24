source :gemcutter

gem "rails", "2.3.11"
gem "ar-extensions"
gem "configatron"
gem "mysql"
gem "cbrunnkvist-psd_logger"
gem "alter_table", :git => "git+ssh://git@github.com/sanger/alter_table.git"
gem "delayed_job", '~>2.0.4'
gem "amqp", "~> 0.9.2"

group :test do
  # bundler requires these gems while running tests
  gem "ci_reporter"

  gem "rcov", :require => false
  #gem "rcov_rails" # gem only for Rails 3, plugin for Rails 2.3 :-/
  # ./script/plugin install http://svn.codahale.com/rails_rcov

  gem "timecop"
  gem "flog"
  gem "flay"
  gem "roodi"
  gem "shoulda", "~>2.10.0"
  gem "test-unit", :require => "test/unit"
  gem "mocha"
  gem "nokogiri"
  gem "cucumber-rails", "~>0.3.2"
  gem "database_cleaner"
  gem "webrat"
  gem "factory_girl", '~>1.3.1'
  gem "treetop", "~>1.2.5"
  gem "webrat-rspec-rails"
  gem "ruby-debug"

  gem 'launchy'
end
