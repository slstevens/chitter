env = ENV["RACK_ENV"] || "development"


require_relative 'models/hashtag'
require_relative 'models/message'
require_relative 'models/user'

# we're telling datamapper to use a postgres database on localhost.
# The name will be "bookmark_manager_test" or "bookmark_manager_development"
# depending on the environment
# DataMapper::Logger.new(STDOUT, :debug)
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
# After declaring your models, you should finalise them
DataMapper.finalize
DataMapper.auto_upgrade!