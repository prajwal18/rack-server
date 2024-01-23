require './utils/name_resolver'
require 'pry'

class Object
  def self.const_missing(c)    
    return nil if @calling_const_missing

    begin
      @calling_const_missing = true
      require RackServer.resolve_name(c.to_s)
      klass = Object.const_get(c)
      klass
    rescue LoadError
      nil
    ensure
      @calling_const_missing = false
    end
  end
end
