require 'active_support'
require 'active_model'

require 'has_unique_identifier/version'
require 'has_unique_identifier/class_methods'
require 'has_unique_identifier/instance_methods'

require_relative 'has_unique_identifier/railtie' if defined? Rails

module HasUniqueIdentifier
  def self.included(base)
    base.send :extend, ClassMethods
    base.send :include, InstanceMethods
  end
end
