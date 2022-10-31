require "rom-repository"
require_relative "../../entities/user"

class UserRepository < ROM::Repository[:users]
  commands :create

  def find(id)
    users.by_pk(id).map_to(User).one
  end
end
