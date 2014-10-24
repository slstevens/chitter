require 'data_mapper'
require 'sinatra'
require 'sinatra/partial'
require 'rack-flash'
require 'dm-timestamps'

require_relative 'data_mapper_setup'
require_relative 'helpers/helpers'
require_relative 'models/hashtag'
require_relative 'models/message'
require_relative 'models/user'
require_relative 'models/reply'

require_relative 'controllers/application'
require_relative 'controllers/peeps'
require_relative 'controllers/sessions'
require_relative 'controllers/users'
require_relative 'controllers/replies'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash, :sweep => true
set :partial_template_engine, :erb
set :public_folder, 'public'

