require "rake"
require "sqlite3"
require_relative "./config/app"
require_relative "./adapters/repositories/user_repository"

app = App.new

namespace :db do
  desc "Create DB"
  task :create do
    SQLite3::Database.new(app.db_name)
  end

  desc "Migrate DB"
  task :migrate do
    app.migration.apply(app.gateway.connection, :up)
  end

  desc "Create DB Seed"
  task :seed do
    user_repository = UserRepository.new(app.rom)
    user_repository.create(name: "Smith", email: "smith@exmaple.com")
    user_repository.create(name: "James", email: "james@example.com")
  end
end

desc "Start dev server"
task :dev do
  sh("rackup")
end
