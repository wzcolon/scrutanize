module Scrutanize
  module Concerns
    module Models
      module DeleteableBehavior
        extend ActiveSupport::Concern

        included do
          scope :not_deleted, -> { where(deleted_at: nil) }

          def soft_delete
            update_attribute(:deleted_at, Time.zone.now)
          end

          def restore
            update_attribute(:deleted_at, nil)
          end
        end
      end
    end
  end
end
