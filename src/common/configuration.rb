module Common
  class Configuration

    def self.db_env
      ENV['MONGOID_ENV']
    end

    def self.db_url
      ENV['MONGODB_URI']
    end

  end
end
