module Scrutanize
  class InstallGenerator < Rails::Generators::Base
    def create_initializer_file
      create_file "config/initializers/scrutanize.rb",
        <<-configuration
Scrutanize.configure do |config|
  # Configure where the back button in audit logs goes
  # config.back_link_path = '/'
  # config.records_per_page = 20
end
        configuration
    end

    def copy_migrations
      %x(bundle exec rake scrutanize:install:migrations)
    end

    def create_schedule_file
      if File.exist?(Rails.root.join('config/schedule.rb'))
        open('config/schedule.rb', 'a') { |f|
          f.puts schedule_copy
        }
      else
        create_file "config/schedule.rb", schedule_copy
      end
    end

    private

    def schedule_copy
      <<-schedule
# Run all audits defined in `app/models/auditors` once a day.
# To create your own schedule see
# https://github.com/javan/whenever#example-schedulerb-file

every 1.day, :at => '4:30 am' do
  runner "Scrutanize::Auditor.run_all_audits"
end
      schedule
    end
  end
end
