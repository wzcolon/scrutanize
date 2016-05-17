module Scrutanize
  class AuditLog < ActiveRecord::Base
    include Scrutanize::Concerns::Models::DeleteableBehavior

    if Rails.version.to_i < 4
      attr_accessible :audit_type, :message
    end

    paginates_per Scrutanize.configuration.defaults_per_page

    validates :audit_type, presence: true

    belongs_to :report
  end
end
