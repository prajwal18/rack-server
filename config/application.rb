module RackServer
  class Application
    def call(env)
      [200, { 'Content-Type' => 'text/html' }, ['<h1>Hello from Ruby</h1>']]
    end
  end
end
