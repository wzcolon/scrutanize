module Scrutanize
  class AuditLogsController < ApplicationController

    def index
      session[:audit_log_path] = audit_logs_path
      @audit_logs = AuditLog.not_deleted
    end

    def show_all
      session[:audit_log_path] = all_audit_logs_path
      @audit_logs = AuditLog.all
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

    def audit_log
      @audit_log ||= AuditLog.find(params[:id])
    end
  end
end
