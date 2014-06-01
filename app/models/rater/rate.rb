module Rater
  class Rate < ActiveRecord::Base
    belongs_to :rateable, polymorphic: true

    validates :value, presence: true
  end
end
