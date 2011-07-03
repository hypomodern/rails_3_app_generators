gem "capybara", ">= 1.0.0", :group => [:cucumber, :test]
gem "cucumber-rails", ">= 1.0.2", :group => [:cucumber, :test]
gem "database_cleaner", ">= 0.6.7", :group => [:cucumber, :test]
gem "fabrication", ">= 1.0.1", :group => [:cucumber, :test]
gem "rspec-rails", ">= 2.6.1", :group => [:cucumber, :development, :test]
gem "thin"

generators = <<-GENERATORS

    config.generators do |g|
      g.test_framework :rspec, :fixture => true, :views => false
      g.fixture_replacement :fabrication, :dir => "spec/fabricators"
      g.integration_tool :rspec
    end
GENERATORS

application generators

get "http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js",  "app/assets/javascripts/jquery.js"
get "http://documentcloud.github.com/underscore/underscore-min.js", "app/assets/javascripts/underscore.js"

gsub_file 'config/application.rb',
          'config.filter_parameters += [:password]',
          'config.filter_parameters += [:password, :password_confirmation]'
gsub_file 'config/application.rb',
          'config.action_view.javascript_expansions[:defaults] = %w()',
          'config.action_view.javascript_expansions[:defaults] = %w(underscore.js)'

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

DOCS

log docs
