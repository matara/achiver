require 'test_helper'
require 'db_test_helper'
require 'achiever/persistence/goal'
require 'achiever/commands/create_goal'

describe Achiever::Commands::CreateGoal do

  let(:repository) { Object.new }

  it 'no goal in DB' do
    expect(Achiever::Persistence::Goal.all.count).must_equal 0
  end

  describe 'success' do

    before do
      @command = Achiever::Commands::CreateGoal.new(title: Faker::Lorem.word,
                                                    deadline: Date.today,
                                                    check_period: Achiever::Commands::CreateGoal::CHECK_PERIOD.sample,
                                                    repository: repository)
    end

    it 'should use repository store method and return domain model' do
      repository.expects(:store).returns(:domain_model)
      expect(@command.perform).must_equal(:domain_model)
    end

  end

end
