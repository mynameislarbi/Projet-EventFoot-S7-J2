# Web version 🌐

Le site est en live ici 👉 [EventFoot](https://eventfoot.herokuapp.com/)

# Installation ⚙️

Utilisez la commande suivante avant de lancer le programme

```ruby
$ bundle install
```

# Lancer le programme

Il ne vous reste plus qu'à tester l'ensemble des fonctionnalités de l'application comme se créer un compte, voir les conférences,... ! 

```ruby
$ rails server 
```

Rendez-vous ensuite sur le site en local 👉 [EventFoot](http://localhost:3000/)
Enjoy !

# Supprimer la BDD et la relancer

Relance la base de données pour de nouveaux events

```ruby
$ rake db:migrate VERSION=0 
$ rails db:migrate
$ rails db:seed
```

Rendez-vous ensuite sur le site en local 👉 [EventFoot](http://localhost:3000/)
Enjoy !

# Crédit
[Larbi Ait Hamadouche](https://github.com/mynameislarbi)
