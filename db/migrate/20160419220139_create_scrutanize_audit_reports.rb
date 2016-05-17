class CreateScrutanizeAuditReports < ActiveRecord::Migration
  def up
    create_table :scrutanize_audit_reports do |t|
      t.string :name
      t.datetime :deleted_at
      t.string :records_audited

      t.timestamps
    end

    add_column :scrutanize_audit_logs, :audit_report_id, :integer
    add_column :scrutanize_audit_logs, :record_id, :string
    add_index :scrutanize_audit_logs, :audit_report_id
  end

  def down
    remove_index :scrutanize_audit_logs, :audit_report_id
    remove_column :scrutanize_audit_logs, :audit_report_id
    remove_column :scrutanize_audit_logs, :record_id
    drop_table :scrutanize_audit_reports
  end
end
