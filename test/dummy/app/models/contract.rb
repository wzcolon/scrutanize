class Contract < ActiveRecord::Base
  has_one :contract_dependency

  before_save :create_dependency

  def create_dependency
    build_contract_dependency(name: name)
  end
end
