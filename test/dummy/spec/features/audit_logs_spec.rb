require 'rails_helper'

feature 'audit logs ui' do

  describe 'viewing the audit logs' do

    specify 'can view a list of logs', type: :feature do
      visit '/'
      binding.pry
    end
  end
end
