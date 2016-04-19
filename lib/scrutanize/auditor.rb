module Scrutanize
  class Auditor
    attr_accessor :report, :records_to_audit, :audit_errors

    def initialize
      @report = build_new_report
      @records_to_audit ||= records_to_audit # this blows up immediately
      @audit_errors = []
    end

    def run
      report.records_audited = records_to_audit.count

      records_to_audit.each do |record|
        unless valid_record?(record)
          log_audit_error(record)
        end
      end

      report.tap do |report|
        report.save!
      end
    end

    def build_new_report
      AuditReport.new(name: report_name)
    end

    def log_audit_error(record)
      report.audit_logs.build(audit_type: record.class.to_s, message: audit_error_message)
      audit_errors << record
    end

    def records_to_audit
      fail 'audit classes must implement this method'
    end

    # def record_id(record)
    #   record.id
    # end

    def valid_record?(record)
      fail 'audit classes must specify how to validate the record'
    end

    def audit_error_message
      fail 'audit classes must specify what the error message should be'
    end

    # define #report_name in individual auditor classes
    def report_name
      self.class.name
    end

    def self.run_all_audits
      Dir[Rails.root.join('app/models/auditors/*.rb')].each do |f|
        klass_name = f.match(/[^\/]+$/).to_s.gsub('.rb', '')
        klass_name.camelcase.constantize.new.run
      end

      Dir[Rails.root.join('app/models/auditors/**/*.rb')].each do |f|
        klass_name = f.match(/[^\/]+$/).to_s.gsub('.rb', '')
        klass_name.camelcase.constantize.new.run
      end
    end
  end
end
