require 'user_management/persistence/user'

module UserManagement
  module Repositories
    class UserRepository

      def find_by_email(email)
        persistence_model = UserManagement::Persistence::User.where(email: email).first
        UserManagement::Persistence::User.to_domain_model(persistence_model) if persistence_model
      end

      def store(domain_user)
        persistence_model = UserManagement::Persistence::User.from_domain_model(domain_user)
        persistence_model.save
        domain_user
      end

    end
  end
end
