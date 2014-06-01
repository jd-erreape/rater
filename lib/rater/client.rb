module Rater
  class Client
    def initialize(rated_object)
      @rated_object = rated_object
    end

    def rates(refresh=false)
      rated_object.send(:rates, refresh)
    end

    def add(args)
      rates.create!(args)
    end

    def rating
      return 0 if rates(true).empty?

      rates.map(&:value).inject(0, &:+).to_f / rates.size
    end

    private

    def rated_object
      @rated_object
    end
  end
end