## Rails 3 App Generators

A list (jquery now standard in Rails 3.1!):

* My default: rspec, cucumber, and fabrication (a fixture replacement lib) [about which see](https://github.com/paulelliott/fabrication).
* the above plus mongo_mapper

Note, largely to self: it now runs bundle install automagically, which is usually not what we want right away. Skip with `--skip-bundle`.

To use (-T skips test/unit, -O skips active_record):

    rails new APP_NAME -m https://raw.github.com/hypomodern/rails_3_app_generators/master/rspec_cucumber_fabrication.rb -T

plus mongo:

    rails new APP_NAME -m https://raw.github.com/hypomodern/rails_3_app_generators/master/with_mongomapper.rb -T -O

**Thanks!**

* to leshill; for slightly different recipes see [here](https://github.com/leshill/rails3-app).
* to the RailsApps project, who has a bunch of stuff [here](http://railsapps.github.com/).