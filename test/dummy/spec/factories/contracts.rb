FactoryGirl.define do
  factory :contract do
    name "Awesome contract"
  end

  trait :invalid  do
    name "Invalid contract"

    after(:create) do |contract|
      contract.contract_dependency.destroy
    end
  end
end