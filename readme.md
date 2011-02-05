## Rails 3 App Generators

**N.B.** Rails 3.0.3 doesn't recognize https as an internet protocol, so using the command below will fail. In the meantime, consider: `curl https://github.com/hypomodern/rails_3_app_generators/raw/master/rspec_cucumber_fabrication_jquery.rb > /tmp/template.rb; rails new my_app_name -JTm /tmp/template.rb; rm -f /tmp/template.rb`

A list:

* My default: rspec, cucumber, jquery, and [insert fixture replacement here].

To use:

    rails new my_app -JTm \
    https://github.com/hypomodern/rails_3_app_generators/raw/master/rspec_cucumber_fabrication_jquery.rb

**Thanks!** to leshill; for slightly different recipes see [here](https://github.com/leshill/rails3-app).