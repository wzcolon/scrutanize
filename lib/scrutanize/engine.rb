require 'jquery-rails'
require 'bootstrap-sass'
require 'haml'
require 'kaminari'

module Scrutanize
  class Engine < ::Rails::Engine
    isolate_namespace Scrutanize

    require 'scrutanize/concerns/models/deleteable_behavior'
  end
end
