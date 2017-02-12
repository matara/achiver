require 'common/configuration'
require 'mongoid'
Mongoid.load!('config/mongoid.yml', Common::Configuration.db_env)

require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
class MiniTest::Spec
  before :each do
    DatabaseCleaner.clean
  end
end
