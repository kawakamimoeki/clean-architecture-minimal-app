require "rom"
require "rom-sql"
require_relative "../adapters/relations/users"

class App
  attr_reader :config, :gateway, :migration, :rom, :db_name

  def initialize
    @db_name = "db/clean-architecture-minimal-app.db"
    @config = ROM::Configuration.new(:sql, "sqlite://#{@db_name}")
    @config.register_relation(Users)
    @rom = ROM.container(@config)
    @gateway = @rom.gateways[:default]
    @migration = @gateway.migration do
      change do
        create_table(:users) do
          primary_key :id
          column :name , String, null: false
          column :email, String, null: false
        end
      end
    end
  end
end
