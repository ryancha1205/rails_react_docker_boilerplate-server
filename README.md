* Ruby version
2.7.1

* System dependencies

## development Setup

### without Docker

```sh
$ bundle exec rails db:create
$ bundle exec rails db:migrate
$ bundle exec rails db:seed
```

```sh
$ bundle exec rails s
```

### with Docker

```sh
$ docker-compose run --rm rails bundle exec rails db:create
$ docker-compose run --rm rails bundle exec rails db:migrate
$ docker-compose run --rm rails bundle exec rails db:seed
```

```sh
$ docker-compose up
```