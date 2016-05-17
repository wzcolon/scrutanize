FactoryGirl.define do
  factory :audit_log, class: Scrutanize::AuditLog do
    audit_type 'Contract'
    message 'This thing failed'
    deleted_at nil
  end
end
