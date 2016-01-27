module Scrutanize
  class Auditor
    def run
      records_to_audit.each do |record|
        unless valid_record?(record)
          log_audit_error(record)
        end
      end
      audit_errors
    end

    def log_audit_error(record)
      Scrutanize::AuditLog.create(audit_type: record.class, message: audit_error_message)
      audit_errors << record
    end

    def records_to_audit
      fail 'audit classes must implement this method'
    end

    def valid_record?(record)
      fail 'audit classes must specify how to validate the record'
    end

    def audit_errors
      @errors ||= []
    end

    def audit_error_message
      fail 'audit classes must specify what the error message should be'
    end
  end
end
