require "blueprinter"

class UserSerializer < Blueprinter::Base
  identifier :id

  fields :name, :email
end
