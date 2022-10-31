require "hanami/interactor"
require_relative "../config/app.rb"
require_relative "../adapters/repositories/user_repository"
require_relative "../adapters/serializers/user_serializer"

class FindUser
  include Hanami::Interactor

  expose :user

  def initialize(
    repository: UserRepository.new(App.new.rom),
    serializer: UserSerializer
  )
    @repository = repository
    @serializer = serializer
  end

  def call(id)
    begin
      user = @repository.find(id)
      @user = @serializer.render_as_hash(user)
    rescue => e
      error!(e.class.name)
    end
  end
end
