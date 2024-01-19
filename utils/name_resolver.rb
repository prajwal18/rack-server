module Rulers
  def self.to_underscore(string)
    string.gsub(/::/, '/')
          .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
          .gsub(/([a-z\d])([A-Z])/, '\1_\2')
          .tr('-', '_')
          .downcase
  end

  # def self.resolve_name(string)
  #   resolved_name = to_underscore(string)
  #   resolve_name += if resolve_name.include?('_controller')
  #      './app/controller/'
  #   else 
  #     ''
  #   end
  # end
end
