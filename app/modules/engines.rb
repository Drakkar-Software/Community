module Engines
  module_function

  def exists?(name, base = self.class)
    base.const_defined?(name) && base.const_get(name).instance_of?(::Module)
  end
end
