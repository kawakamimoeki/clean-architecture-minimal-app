# Clean Architecture Minimal App

```ruby
gem "hanami-utils" # interactor
gem "sinatra"
gem "sinatra-contrib"
gem "puma"
gem "rom"
gem "rom-repository"
gem "rom-sql"
gem "sqlite3"
```

```ruby
bundle exec rake -T
rake db:create   # Create DB
rake db:migrate  # Migrate DB
rake db:seed     # Create DB Seed
rake dev         # Start dev server
```

```
GET /users/1
```