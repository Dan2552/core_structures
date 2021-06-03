module CoreStructures
  # Decorates any kind of object, to disallow any specific method calls on that
  # object.
  #
  # E.g. if you have an Array object that you want read-only without duplicating
  # the whole array in memory, you could wrap it with this object and deny
  # method calls to mutating methods.
  #
  # ```
  # array = [1, 2]
  # no_add_array = CoreStructures::ProxyWithDeniedMethods.new(array, [:<<])
  # no_add_array.count
  # # => 2
  # no_add_array << 3
  # # => raises an exception
  # ```
  #
  class ProxyWithDeniedMethods
    def initialize(object, denied_methods)
      @object = object
      @denied_methods = denied_methods
    end

    def respond_to?(*args)
      @object.respond_to?(*args)
    end

    def method_missing(meth, *args, &blk)
      if @denied_methods.include?(meth)
        raise "Method #{meth} denied by ProxyWithDeniedMethods"
      end
      @object.public_send(meth, *args, &blk)
    end
  end
end
