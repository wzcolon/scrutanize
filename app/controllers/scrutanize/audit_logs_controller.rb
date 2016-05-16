module Scrutanize
  class AuditLogsController < Scrutanize::ApplicationController

    def index
      session[:audit_log_path] = audit_report_audit_logs_path(report)
      @audit_logs = report.audit_logs.not_deleted
    end

    def show_all
      session[:audit_log_path] = audit_report_show_all_audit_logs_path(report)
      @audit_logs = report.audit_logs.all
      render :index
    end

    def destroy
      if audit_log.soft_delete
        redirect_to session[:audit_log_path]
      else
        render :index
      end
    end

    def restore
      if audit_log.restore
        redirect_to session[:audit_log_path]
      else
        render :index
      end
    end

    private

    def report
      @report ||= AuditReport.find params[:audit_report_id]
    end
    helper_method :report

    def audit_log
      @audit_log ||= AuditLog.find(params[:id])
    end
  end
end
