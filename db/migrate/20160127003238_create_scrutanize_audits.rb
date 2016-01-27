class CreateScrutanizeAudits < ActiveRecord::Migration
  def up
    create_table :scrutanize_audits do |t|
      t.string   :type
      t.string   :message
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
