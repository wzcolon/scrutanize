module Scrutanize
  class Audit < ActiveRecord::Base
    validates :type, presence: true
  end
end
