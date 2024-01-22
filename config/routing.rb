module RackServer
  class Application
    def get_controller_and_action(env)
      _, cont, action, _after = env['PATH_INFO'].split('/', 4)
      cont = cont.capitalize
      cont += 'Controller'
      action = action.nil? || action.empty? ? 'index' : action
      controller = Object.const_get(cont)
      raise RouteError if controller.nil?

      [controller, action]
    rescue NameError => _e
      raise RouteError, 'Controller not found'
    end
  end
end
