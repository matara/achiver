module Achiever
  module Domain
    class Goal

      attr_accessor :title, :deadline, :check_period

      def initialize(attributes)
        attributes.each { |key, value| instance_variable_set(:"@#{key}", value) }
      end

    end
  end
end
