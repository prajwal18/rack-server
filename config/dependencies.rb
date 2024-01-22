require './utils/name_resolver'

class Object
  def self.const_missing(c)
    return nil if @calling_const_missing

    begin
      @calling_const_missing = true
      require RackServer.resolve_name(c.to_s)
      klass = Object.const_get(c)
      @calling_const_missing = false
      klass
    rescue LoadError
      @calling_const_missing = false
      nil
    end
  end
end
