require 'test_helper'
require 'db_test_helper'
require 'user_management/commands/create_user'

describe UserManagement::Commands::CreateUser do

  let(:repository) { Object.new }

  describe 'success' do

    before do
      @command = UserManagement::Commands::CreateUser.new(name: 'Test name',
                                                          email: 'test@mail.com',
                                                          repository: repository)
    end

    it 'should use repository store method and return domain model' do
      repository.expects(:store).returns(:domain_model)
      expect(@command.perform).must_equal(:domain_model)
    end

  end

end
