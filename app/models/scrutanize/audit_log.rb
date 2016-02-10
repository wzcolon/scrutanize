module Scrutanize
  class AuditLog < ActiveRecord::Base
    if Rails.version.to_i < 4
      attr_accessible :audit_type, :message
    end

    default_scope -> { where(deleted_at: nil) }

    validates :audit_type, presence: true

    def soft_delete
      update_attribute(:deleted_at, Time.zone.now)
    end

    def undelete
      update_attribute(:deleted_at, nil)
    end
  end
end
