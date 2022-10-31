require "rom"

class Users < ROM::Relation[:sql]
  schema(:users) do
    attribute :id, Types::Serial
    attribute :name, Types::String
    attribute :email, Types::String
  end
end
