module Rater
  module Rated
    extend ActiveSupport::Concern

    included do
      has_many :rates, as: :rateable, class_name: 'Rater::Rate'
    end

    module ClassMethods
      def rated(options = {})

      end
    end


    def rater
      Rater::Client.new(self)
    end
  end
end

ActiveRecord::Base.send :include, Rater::Rated