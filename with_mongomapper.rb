gem "mongo_mapper", :git => "https://github.com/jnunemaker/mongomapper.git", :branch => "master"
gem "bson_ext"
gem "capybara", ">= 0.4.0", :group => [:cucumber, :test]
gem "cucumber-rails", ">= 0.3.2", :group => [:cucumber, :test]
gem "database_cleaner", ">= 0.5.2", :group => [:cucumber, :test]
gem "fabrication", ">= 0.9.4"
gem "rspec-rails", ">= 2.2.1", :group => [:cucumber, :development, :test]
gem "mongo_ext", :group => :production

generators = <<-GENERATORS

    config.generators do |g|
      g.orm :mongo_mapper
      g.test_framework :rspec, :fixture => true, :views => false
      g.fixture_replacement :fabrication, :dir => "spec/fabricators"
      g.integration_tool :rspec
    end
GENERATORS

application generators

get "http://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js",  "public/javascripts/jquery.js"
get "http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js", "public/javascripts/jquery-ui.js"
get "http://documentcloud.github.com/underscore/underscore-min.js", "public/javascripts/underscore.js"

gsub_file 'config/application.rb',
          'config.filter_parameters += [:password]',
          'config.filter_parameters += [:password, :password_confirmation]'
gsub_file 'config/application.rb',
          'config.action_view.javascript_expansions[:defaults] = %w()',
          'config.action_view.javascript_expansions[:defaults] = %w(jquery.js jquery-ui.js underscore.js)'

create_file "log/.gitkeep"
create_file "tmp/.gitkeep"

git :init
git :add => "."

create_file "log/.gitkeep"
create_file "tmp/.gitkeep"

git :init
git :add => "."

docs = <<-DOCS

Run the following commands to complete the setup of #{app_name.humanize}:

% cd #{app_name}
% rvm use --create --rvmrc default@#{app_name}
% gem install bundler
% bundle install
% rails g rspec:install
% rails g cucumber:install --rspec --capybara
% rails g mongo_mapper:config

DOCS

log docs
