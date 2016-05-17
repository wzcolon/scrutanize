class CreateScrutanizeAudits < ActiveRecord::Migration
  def up
    create_table :scrutanize_audit_logs do |t|
      t.string   :audit_type
      t.string   :message
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
