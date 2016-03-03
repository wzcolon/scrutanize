require 'rails_helper'

describe ContractAuditor do
  let!(:contract) { create(:contract, :invalid) }

  specify 'verifies that a contract has a dependency' do
    results = described_class.new.run

    expect(results).to eq [contract]
  end

  specify 'logs an audit error when a contract does not have a dependency' do
    described_class.new.run

    expect(Scrutanize::AuditLog.count).to eq 1

    audit_log = Scrutanize::AuditLog.first

    expect(audit_log.message).to eq 'Contract does not have a dependency'
  end
end
