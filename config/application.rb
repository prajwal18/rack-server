require_relative 'routing'
require_relative 'dependencies'

module RackServer
  class Application
    include Error

    def call(env)
      resolver do
        klass, act = get_controller_and_action(env)
        controller = klass.new(env)
        raise RouteError, 'Route not found' unless controller.respond_to?(act)

        controller.send(act)
      end
    end
  end
end
