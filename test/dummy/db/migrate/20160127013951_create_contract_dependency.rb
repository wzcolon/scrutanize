class CreateContractDependency < ActiveRecord::Migration
  def change
    create_table :contract_dependencies do |t|
      t.string :name
      t.integer :contract_id
      t.timestamps
    end
  end
end
