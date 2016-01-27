require 'rails_helper'

describe Scrutanize::Audit do
  it { should have_db_column :type }
  it { should have_db_column :message }
  it { should have_db_column :deleted_at }
  it { should have_db_column :created_at }
  it { should have_db_column :updated_at }

  it { should validate_presence_of :type }
end
