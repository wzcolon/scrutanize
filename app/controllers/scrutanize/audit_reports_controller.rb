module Scrutanize
  class AuditReportsController < Scrutanize::ApplicationController

    def index
      session[:audit_reports_path] = audit_reports_path
      @audit_reports = AuditReport.not_deleted.order('created_at DESC').page params[:page]
    end

    def show_all
      session[:audit_reports_path] = show_all_audit_reports_path
      @audit_reports = AuditReport.order('created_at DESC').page params[:page]
      render :index
    end

    def destroy
      if report.soft_delete
        redirect_to session[:audit_reports_path]
      else
        render :index
      end
    end

    def restore
      if report.restore
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
  end
end
