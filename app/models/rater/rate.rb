module Rater
  class Rate < ActiveRecord::Base
    validates :value, presence: true
  end
end
