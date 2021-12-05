# Weather in UK postcodes

ruby version 3.0.3

bundle install/update

Set an environment variable weather_api_key which is your key for accessing weatherapi

rails db:create

rails db:migrate and rails db:migrate RAILS_ENV=test

It may be you need to reinstall webpacker with rails webpacker:install, if the frontends are failing with Rails: Webpacker::Manifest::MissingEntryError

rspec runs the tests

rubocop runs the linting

rails db:seed

rails server to test the app in development environment

To test the app with different temperature thresholds, go into the console, delete the default threshold, and create one with different warm and hot thresholds
