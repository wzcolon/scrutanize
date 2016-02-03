module Scrutanize
  class AuditLog < ActiveRecord::Base
    if Rails.version.to_i < 4
      attr_accessible :audit_type, :message
    end

    validates :audit_type, presence: true
  end
end
