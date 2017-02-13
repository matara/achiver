require 'test_helper'
require 'db_test_helper'
require 'common/errors/not_found_error'
require 'user_management/domain/user'
require 'user_management/queries/find_user'
require 'user_management/repositories/user_repository'
require 'user_management/factories/user_factory'

describe UserManagement::Queries::FindUser do

  let(:repository) { UserManagement::Repositories::UserRepository.new }
  let(:email) { 'test@mail.com' }

  before do
    @query = UserManagement::Queries::FindUser.new(email: email, repository: repository)
  end

  it 'not found' do
    expect { @query.perform }.must_raise NotFoundError
  end

  describe 'found' do

    before do
      UserManagement::Factories::UserFactory.create(email: email)
    end

    it 'must return domain model' do
      expect(@query.perform.class).must_equal UserManagement::Domain::User
    end
  end

end
