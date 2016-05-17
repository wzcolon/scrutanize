FactoryGirl.define do
  factory :audit_report, class: Scrutanize::AuditReport do
    name 'ContractAuditor'
    records_audited 5
  end
end
