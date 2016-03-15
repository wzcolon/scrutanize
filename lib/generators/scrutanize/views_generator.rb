module Scrutanize
  class ViewsGenerator < Rails::Generators::Base

    source_root Engine.root.join('app')

    def copy_views
      copy_file "controllers/scrutanize/audit_logs_controller.rb", "app/controllers/scutanize/audit_logs_controller.rb"

      copy_file "views/scrutanize/audit_logs/index.html.haml", "app/views/scrutanize/audit_logs/index.html.haml.rb"
    end

  end
end
