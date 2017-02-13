require 'common/mixin/model_id'
require 'user_management/domain/user'

module UserManagement
  module Persistence
    class User
      include Common::Mixin::ModelId
      include ::Mongoid::Document
      include Mongoid::Timestamps

      store_in collection: 'users'

      field :name, type: String
      field :email, type: String
      field :password, type: String

      def self.from_domain_model(user)
        self.new(name: user.name, email: user.email, password: user.password)
      end

      def self.to_domain_model(user)
        UserManagement::Domain::User.new(name: user.name, email: user.email, password: user.password)
      end

    end
  end
end
