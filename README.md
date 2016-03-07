Scrutanize
==========

This library assists in auditing a database for consistency.

Install
-------
in Gemfile...
`gem 'scrutanize'`

Install the gem with
`rails g scrutanize:install`

This will copy a migration to your project and create two files:

  1. config/schedule.rb

    Use this file to configure when you would like to run your audits. See
    https://github.com/javan/whenever for configuration options. By default it
    will run all of the audits configured in `app/models/auditors`
    once a day at 4:30 am.

    Once you have configured the file to your liking, write the job to your
    cron file by running `whenever -w`.

    If you do not want to use cron jobs to run your audits, delete this file.

  2. config/initializers/scrutanize.rb

    This file allow you to easily configure the back button in the audit logs
    view to redirect to a path of your choosing. By default it takes you to
    '/'.
