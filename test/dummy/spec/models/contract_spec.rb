require 'rails_helper'

describe Contract do
  specify 'create a dependency when saved' do
    contract = described_class.create(name: 'test_contract')
    expect(contract.contract_dependency).to be
  end
end
