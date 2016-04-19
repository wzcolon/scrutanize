require 'rails_helper'

feature 'audit logs ui' do
  let!(:contract) { create(:contract, :invalid) }

  describe 'viewing audit reports' do
    before do
      ContractAuditor.new.run
      visit '/scrutanize/audit_reports'
    end

    specify 'can view a list of reports', :js do
      expect(page).to have_selector 'table tbody tr', count: 1
    end

    specify 'can delete an audit report and restore it' do
      click_button 'Delete'

      expect(page).to have_selector 'table tbody tr', count: 0

      click_link 'Show with deleted'

      expect(page).to have_selector 'table tbody tr', count: 1

      click_button 'Restore'
      click_link 'Hide deleted'

      expect(page).to have_selector 'table tbody tr', count: 1
      expect(page).to have_button 'Delete'
    end
  end

  describe 'viewing audit logs' do
    before do
      ContractAuditor.new.run
      visit '/scrutanize/audit_reports'

      within '.view-audit-report' do
        click_on 'ContractAuditor'
      end
    end

    specify 'can view failed logs within a report' do
      expect(page).to have_content('Audit Logs')

      within 'table tbody tr' do
        expect(page).to have_content 'Contract does not have a dependency'
        expect(page).to have_content Time.zone.now.to_formatted_s(:long)
        expect(page).to have_button 'Delete'
      end
    end

    specify 'can view and restore deleted logs' do
      expect(page).to have_selector 'table tbody tr', count: 1

      within '.audit-logs' do
        click_button 'Delete'
      end

      expect(page).to have_selector 'table tbody tr', count: 0

      click_link 'Show with deleted'

      expect(page).to have_selector 'table tbody tr', count: 1

      click_button 'Restore'
      click_link 'Hide deleted'

      expect(page).to have_selector 'table tbody tr', count: 1
      expect(page).to have_button 'Delete'
    end

    specify 'can restore a deleted log' do
      within '.audit-logs' do
        click_button 'Delete'
      end

      click_link 'Show with deleted'
      click_button 'Restore'

      click_link 'Hide deleted'

      expect(page).to have_selector 'table tbody tr', count: 1
      expect(page).to have_button 'Delete'
    end
  end
end
