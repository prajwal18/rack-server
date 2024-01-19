# User and Customer App/config.ru
require './config/application'

run RackServer::Application.new
