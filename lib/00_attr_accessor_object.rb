require "byebug"

class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...
    names.each do |name|
      name = name.to_s
      # define the setter
      define_method("#{name}="){|arg| instance_variable_set("@#{name}", arg)}

      # define the getter
      define_method("#{name}"){instance_variable_get("@#{name}")}
    end

  end

end
