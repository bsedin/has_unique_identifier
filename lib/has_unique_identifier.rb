require 'has_unique_identifier/version'
require 'has_unique_identifier/class_methods'
require 'has_unique_identifier/instance_methods'

require_relative 'has_unique_identifier/railtie' if defined? Rails

module HasUniqueIdentifier
  def self.setup_orm(base)
    base.class_eval do
      extend ClassMethods
      include InstanceMethods
    end
  end
end
