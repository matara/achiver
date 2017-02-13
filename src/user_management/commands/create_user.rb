require 'user_management/domain/user'

module UserManagement
  module Commands
    class CreateUser

      def initialize(name:, email:, repository:)
        @name = name
        @email = email
        @repository = repository
      end

      def perform
        @repository.store(create_domain_model)
      end

      private
      def create_domain_model
        UserManagement::Domain::User.new(name: @name, email: @email)
      end

    end
  end
end
