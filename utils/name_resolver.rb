require 'pry'
module RackServer
  def self.to_underscore(string)
    string.gsub(/::/, '/')
          .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
          .gsub(/([a-z\d])([A-Z])/, '\1_\2')
          .tr('-', '_')
          .downcase
  end

  def self.resolve_name(string)
    resolved_name = to_underscore(string)

    case resolved_name
    when /controller/
      "./app/controller/#{resolved_name}"
    when /error/
      './app/error/error'
    when /_service/
      "./service/#{resolved_name}"
    end
  end
end
