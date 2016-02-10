module Scrutanize
  class AuditLogsController < ApplicationController

    def index
      @audit_logs = AuditLog.all
    end

    def destroy
      if audit_log.soft_delete
        redirect_to audit_logs_path
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
