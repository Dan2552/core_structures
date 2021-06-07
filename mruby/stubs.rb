def require(*args); end

class Object
  def public_send(*args, &blk)
    send(*args, &blk)
  end
end
