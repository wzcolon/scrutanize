module Scrutanize
  class AuditLog < ActiveRecord::Base
    validates :audit_type, presence: true
  end
end
