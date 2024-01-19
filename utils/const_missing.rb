require './utils/name_resolver'
require 'pry'
class Object
  def self.const_missing(c)
    a = Rulers.to_underscore(c.to_s)
    puts a
    warn "Missing constant: #{c.inspect}! #{c}"
  end
end

UsersController
