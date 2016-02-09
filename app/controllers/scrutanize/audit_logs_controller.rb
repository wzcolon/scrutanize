module Scrutanize
  class AuditLogsController < ApplicationController

    def index
      AuditLog.all
    end

  end
end
