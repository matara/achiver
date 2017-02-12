require 'test_helper'
require 'db_test_helper'
require 'achiever/repositories/goal_repository'
require 'achiever/persistence/goal'
require 'achiever/factories/goal_factory'

describe Achiever::Repositories::GoalRepository do

  let(:repository) { Achiever::Repositories::GoalRepository.new }

  describe 'store' do
    before do
      domain_model = Achiever::Factories::GoalFactory.build
      @result = repository.store(domain_model)
    end

    it 'should return domain model' do
      expect(@result.class).must_equal Achiever::Domain::Goal
    end

    it 'should store goal in DB' do
      expect(Achiever::Persistence::Goal.all.count).must_equal 1
    end

  end

end
