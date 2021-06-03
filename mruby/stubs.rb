def require(*args); end

class Object
  def public_send(*args)
    send(*args)
  end
end
