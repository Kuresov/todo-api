module Authorization

  class AuthorizationError < StandardError; end

  def authorized?(record)
    if record.is_a?(User) # if record = a user, then...
      if @authenticated_user.id != record.id
        raise AuthorizationError
      end
    else #The record is not a user
      if @authenticated_user.id != record.user.id
        raise AuthorizationError
      end
    end
  end
end
