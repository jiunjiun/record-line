class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  module Sourceable
    RECORD_START = 1
    RECORD_END   = 2
  end
end
