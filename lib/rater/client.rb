module Rater
  class Client
    def initialize(rated_object)
      @rated_object = rated_object
    end

    def rates(refresh=false)
      return @rates if !refresh && @rates

      @rates = rated_object.send(:rates, true)
    end

    def add(args)
      Rater::Rate.create!(args.merge(rateable: rated_object))
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