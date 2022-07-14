# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
ruby-3.1.2
Rails 7.0.3.1

* System dependencies
```terminal
bundle install
```

* Configuration
Create environment variables
DATABASE_USERNAME
DATABASE_PASSWORD

* Database creation
```terminal
bundle exec rails db:create
```

* Database initialization
```terminal
rake db:migrate
rails db:seed
```

*Routes
```Ruby
GET /brands
GET /brands/:id/models
POST /brands
POST /brands/:id/models
PUT /models/:d
GET /models?greater=&lower=
```

* How to run the test suite
```terminal
rake db:migrate RAILS_ENV=test
rake db:seed RAILS_ENV=test
rspec
```
### Notas
> Fue divertido la prueba realizar un API desde cero hay muchas que se pueden
> implementar, sin embargo, dado el tiempo es imposible como feedback puedo
> comentar los siguiente:
>
> No pude agregar la validacion unique a la columna name de brands porque en el
> json seed que nos proporciana ya existe data repetida.
>
> Me faltaron agregar mas pruebas sin embargo el enfoque seria el mismo, probar tanto
> happy path como bad path, me faltaron algunos metodos de los modelos.