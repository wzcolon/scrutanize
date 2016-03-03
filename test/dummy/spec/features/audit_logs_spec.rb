require 'rails_helper'

feature 'audit logs ui' do

  describe 'viewing audit logs' do

    let(:contract) { Contract.create(name: 'contract name') }

    before do
      contract.contract_dependency.destroy # makes an invalid contract
      contract.reload
      ContractAuditor.new.run
    end

    specify 'can view a list of logs', :js do
      visit '/scrutanize/audit_logs'

      expect(page).to have_selector 'table tbody tr', count: 1

      within 'table tbody tr' do
        expect(page).to have_content 'Contract does not have a dependency'
        expect(page).to have_content Time.zone.now.to_formatted_s(:long)
        expect(page).to have_button 'Delete'
      end
    end

    specify 'can view deleted logs' do
      visit '/scrutanize/audit_logs'

      within '.audit-logs' do
        click_button 'Delete'
      end

      expect(page).to have_no_selector 'table tbody tr'

      click_link 'Show with deleted'

      expect(page).to have_selector 'table tbody tr'
    end

    specify 'can restore a deleted log' do
      visit '/scrutanize/audit_logs'

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
