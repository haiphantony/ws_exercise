## Local development


### Required software

* Ruby 2.5.0

* Ruby on Rails 5.1.5

* PostgreSQL 9.5 or later

### Database setup

```
bin/rails db:setup

```

### Run Specs (Tests)

```
bundle exec rspec

```


### Start local servers

```
bundle exec foreman start

=> You should access http://localhost:5000/

or

(on different tabs)

bin/rails server

bin/webpack-dev-server

```