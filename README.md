# Reclame ai

[![CircleCI](https://circleci.com/gh/felipetio/reclameai.svg?style=svg)](https://circleci.com/gh/felipetio/reclameai)

> Você está responsável por desenvolver a página de reclamação de entregas de um varejista do ramo de eletrônicos.  Mas queremos evitar de receber reclamações suspeitas que só nos atrapalham. Para isso queremos evitar que Reclamaçõe sejam realizadas de localizações longe do local da entrega. Para isso você pode usar qualquer API de localização que se sentir mais confortável.

> Sua aplicação deve ser capaz de permitir a qualquer pessoa registrar suas reclamações e deve ter uma forma de um atendente vizualizar as reclamações cadastradas e diferenciá-las das suspeitas.

### Installation
It requires [Ruby 2.6.3](https://www.ruby-lang.org/en/news/2019/04/17/ruby-2-6-3-released/) and Postgres to run.

```sh
$ cd reclameai
$ bundle install
$ yarn install
$ sudo -u postgres psql -c 'create database reclameai_dev;'
$ sudo -u postgres psql -c 'create database reclameai_test;'
$ rake db:migrate
$ rake db:fixtures:load #to add clients and orders
$ rails s
```

How to run the test suite:
```sh
$ sudo -u postgres psql -c 'create database reclameai_test;'
$ rake db:migrate RAILS_ENV=test
$ rails test
```

### Installation
Check it online at https://reclameai.herokuapp.com/tickets
