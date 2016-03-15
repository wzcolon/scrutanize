Scrutanize
==========

This library assists in auditing a database for consistency.

Specifically, it aids in the setup/organization of auditor classes and adds a
simple UI for viewing audit logs.

If you're using Rails 3.2.x, you must use version ~> 0.0.1 of this gem.

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

Finally, mount the engine in your `config/routes.rb`
`mount Scrutanize::Engine => "/scrutanize"`

Creating Auditors
-----------------
Create auditors in `app/models/auditors`

Example:

```ruby
# app/models/auditors/contract_auditor.rb
class ContractAuditor < Scrutanize::Auditor
  def records_to_audit
    Contract.all
  end

  def valid_record?(contract)
    contract.contract_dependency.present?
  end

  def audit_error_message
    "Contract does not have a dependency"
  end
end
```

Configure each auditor by specifying the records_to_audit, what makes a record
valid, and the error message to log should a record fail the audit.

Viewing Audit Logs
------------------

Whenever a record fails an audit, a entry is logged. These are viewable at
'scrutanize/audit_logs' by default but you can mount the engine where you
like.

![alt text](https://github.com/wzcolon/scrutanize/raw/master/screenshot.png "Audit Log Example")

Audit logs can be deleted and undeleted.

Note: If you need to add authorization to the audit_logs views, then run
`rails g scrutanize:views` which will copy over the controller and view files
for editing.
