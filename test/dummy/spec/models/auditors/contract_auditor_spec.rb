require 'rails_helper'

describe ContractAuditor do
  let!(:contract) { create(:contract, :invalid) }

  specify 'verifies that a contract has a dependency' do
    report = subject.run

    expect(Scrutanize::AuditReport.count).to eq 1
    expect(report.audit_logs.count).to eq 1
    expect(report.audit_logs.first.message).to eq 'Contract does not have a dependency'
  end

  specify 'logs an audit error when a contract does not have a dependency' do
    described_class.new.run

    expect(Scrutanize::AuditLog.count).to eq 1

    audit_log = Scrutanize::AuditLog.first

    expect(audit_log.message).to eq 'Contract does not have a dependency'
  end
end
