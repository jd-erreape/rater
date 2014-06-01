module Rater
  module Rated
    extend ActiveSupport::Concern

    included do
      has_many :rates, as: :rateable, class_name: 'Rater::Rate'
      private :rates, :rates= # Do not allow access to rates directly from outside
    end

    module ClassMethods

    end


    def rater
      Rater::Client.new(self)
    end
  end
end
