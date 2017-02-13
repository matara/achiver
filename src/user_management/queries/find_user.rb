require 'common/errors/not_found_error'

module UserManagement
  module Queries
    class FindUser

      def initialize(email: email, repository: repository)
        @email = email
        @repository = repository
      end

      def perform
        user = @repository.find_by_email(@email)
        raise NotFoundError unless user
        user
      end

    end
  end
end
