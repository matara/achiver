require 'achiever/persistence/goal'

module Achiever
  module Repositories
    class GoalRepository

      def store(goal)
        persistence_goal = Achiever::Persistence::Goal.from_domain_model(goal)
        persistence_goal.save
        Achiever::Persistence::Goal.to_domain_model(persistence_goal)
      end

    end
  end
end
