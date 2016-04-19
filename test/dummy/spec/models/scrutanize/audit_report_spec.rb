require 'rails_helper'

describe Scrutanize::AuditReport do
  it { should have_db_column :name }
  it { should have_db_column :records_audited }
  it { should have_db_column :deleted_at }
  it { should have_db_column :created_at }
  it { should have_db_column :updated_at }

  describe '#fail_rate' do
    let(:failed_log) { create(:audit_log) }
    let(:failed_log_2) { create(:audit_log) }
    let(:report) { create(:audit_report,
                          audit_logs: [failed_log, failed_log_2],
                          records_audited: 10
                         ) }

    specify 'calculates percentage of failing audits' do
      expect(report.fail_rate).to eq 0.2
    end
  end
end
