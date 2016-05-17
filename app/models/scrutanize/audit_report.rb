module Scrutanize
  class AuditReport < ActiveRecord::Base
    include Scrutanize::Concerns::Models::DeleteableBehavior

    paginates_per Scrutanize.configuration.defaults_per_page

    has_many :audit_logs, class_name: Scrutanize::AuditLog, dependent: :destroy

    def fail_rate
      audit_logs.count.to_f / records_audited.to_f
    end
  end
end
