require "scrutanize/engine"
require "scrutanize/auditor"

module Scrutanize
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :back_link_path, :defaults_per_page

    def initialize
      @back_link_path = '/'
      @defaults_per_page = 20
    end
  end
end
