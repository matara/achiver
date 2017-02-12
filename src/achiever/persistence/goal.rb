require 'common/mixin/model_id'
require 'achiever/domain/goal'

module Achiever
  module Persistence
    class Goal
      include Common::Mixin::ModelId
      include ::Mongoid::Document

      store_in collection: 'goals'

      field :title, type: String
      field :deadline, type: Date
      field :check_period, type: String

      def self.from_domain_model(goal)
        self.new(title: goal.title, deadline: goal.deadline, check_period: goal.check_period)
      end

      def self.to_domain_model(goal)
        Achiever::Domain::Goal.new(title: goal.title, deadline: goal.deadline, check_period: goal.check_period)
      end

    end
  end
end
