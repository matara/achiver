module UserManagement
  module Domain
    class User

      attr_accessor :name, :email, :password

      def initialize(name:, email:, password: nil)
        @name = name
        @email = email
        @password = password
      end

    end
  end
end
