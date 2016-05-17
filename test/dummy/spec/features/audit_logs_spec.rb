require 'rails_helper'

feature 'viewing audit logs' do
  let!(:contract) { create(:contract, :invalid) }

  before do
    Timecop.freeze(Time.zone.now)
    ContractAuditor.new.run
    visit '/scrutanize/audit_reports/1/audit_logs'
  end

  after do
    Timecop.return
  end

  describe 'audit logs table' do

    describe 'columns' do
      specify 'has the right columns' do
        within 'table thead tr:nth-child(1)' do
          expect(page).to have_content 'Audit Type'
          expect(page).to have_content 'Record Id'
          expect(page).to have_content 'Message'
          expect(page).to have_content 'Created At'
          expect(page).to have_content 'Actions'
        end
      end
    end

    specify 'has audit type' do
      within 'table tbody tr:nth-child(1) td:nth-child(1)' do
        expect(page).to have_content 'Contract'
      end
    end

    specify 'has a record id' do
      within 'table tbody tr:nth-child(1) td:nth-child(2)' do
        expect(page).to have_content "Contract #{contract.id}"
      end
    end

    specify 'has a message' do
      within 'table tbody tr:nth-child(1) td:nth-child(3)' do
        expect(page).to have_content ContractAuditor.new.audit_error_message
      end
    end

    specify 'has created at' do
      within 'table tbody tr:nth-child(1) td:nth-child(4)' do
        expect(page).to have_content Time.zone.now.to_formatted_s(:long)
      end
    end

    specify 'has actions' do
      within 'table tbody tr:nth-child(1) td:nth-child(5)' do
        expect(page).to have_button 'Delete'
      end
    end
  end

  describe 'pagination' do
    before do
      30.times do
        create(:contract, :invalid)
      end
    end

    specify 'defaults to 20 records per page' do
      Scrutanize::Auditor.run_all_audits

      report = Scrutanize::AuditReport.last
      visit audit_report_audit_logs_path(report)

      within 'table tbody' do
        expect(page).to have_css('tr', count: 20)
      end

      within '.pagination' do
        expect(page).to have_link '2', href: audit_report_audit_logs_path(audit_report_id: report.id, page: 2)
      end
    end
  end
end
