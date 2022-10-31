require "sinatra"
require "sinatra/json"
require_relative "../../usecases/find_user"

get "/users/:id" do
  find = FindUser.new.call(params["id"])

  if find.success?
    if find.user
      status 200
      body = find.user
    else
      status 404
      body = { error: "Not found!" }
    end
  else
    status 500
    body = { error: find.error }
  end

  json body
end
