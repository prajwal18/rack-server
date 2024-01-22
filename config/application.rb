require_relative 'routing'
$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'app', 'controller')
require 'users_controller'
require 'customers_controller'
$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'app', 'error')
require 'resolver'
require 'all_error'

module RackServer
  class Application
    include Error
    def call(env)
      resolver do
        klass, act = get_controller_and_action(env)
        controller = klass.new(env)
        raise RouteError, 'Route not found' unless controller.respond_to?(act)

        text = controller.send(act)
        [200, { 'Content-Type' => 'text/html' }, [text]]
      end
    end
  end
end
