Scrutanize
==========

This library assists in auditing a database for consistency.

Install
-------
in Gemfile...

`gem 'scrutanize'`
`bundle exec rake scrutanize:install:migrations`
`rake db:migrate`

In your application.rb file add
`config.autoload_paths += Dir["#{Rails.root}/app/models/scrutanize/**/"]`
