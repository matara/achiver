require 'user_management/domain/user'
require 'user_management/repositories/user_repository'

module UserManagement
  module Factories
    class UserFactory

      def self.build(**attributes)
        UserManagement::Domain::User.new(user_defaults.merge(attributes))
      end

      def self.create(**attributes)
        user = self.build(**attributes)
        UserManagement::Repositories::UserRepository.new.store(user)
        user
      end

      private

      def self.user_defaults
        {
            name: Faker::Name.name,
            email: Faker::Internet.email,
            password: nil
        }
      end

    end
  end
end
