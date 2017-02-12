# Dotenv
if ENV['ENV_FILE']
  require 'dotenv'
  Dotenv.load(ENV['ENV_FILE'])
end

# Minitest
require 'minitest/autorun'
require 'minitest/hooks/default'

# Faker
require 'faker'

# Helper
require 'mocha/mini_test'
require 'mock_test_helper'
