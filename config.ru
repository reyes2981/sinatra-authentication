require_relative './config/enviroment'

use Rack::MethodOverride
use SessionsController
use PostsController
use UsersController
run ApplicationController


# I need to mount controllers in this file, config.ru