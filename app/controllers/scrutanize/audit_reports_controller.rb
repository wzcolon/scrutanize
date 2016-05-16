module Scrutanize
  class AuditReportsController < Scrutanize::ApplicationController

    def index
      session[:audit_reports_path] = audit_reports_path
      @audit_reports = AuditReport.not_deleted
    end

    def show
      session[:audit_reports_path] = audit_report_audit_logs_path(report)
      @audit_logs = AuditLog.not_deleted
    end

    def show_all
      session[:audit_reports_path] = show_all_audit_reports_path
      @audit_reports = AuditReport.all
      render :index
    end

    def destroy
      if audit_report.soft_delete
        redirect_to session[:audit_reports_path]
      else
        render :index
      end
    end

    def restore
      if audit_report.restore
        redirect_to session[:audit_reports_path]
      else
        render :index
      end
    end

    private

    def report
      @report ||= AuditReport.find(params[:id])
    end
    helper_method :report

    def audit_report
      @audit_report ||= AuditReport.find(params[:id])
    end
  end
end
