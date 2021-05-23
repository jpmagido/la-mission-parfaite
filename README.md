# README

> L'app a pour but de contraliser un maximum d'information pour les CDD de FranceTV.

- Les Restaurants
- Les Lieux de couchage
- Autres Infos diverses

> L'idée est que chaque invité puisse y publier librement ses bons plans 


Partie USER

Connexion via une page pour avoir accès au site
Consultation des Restaurants par Région
Consultation des lieux de couchage par Région

Partie ADMIN

Gestion des Utilisateurs, des Mots de Passe et autres réjouissance

_____________
_____________



* Architecture Monolithe Rails avec Front intégré en ERB

* Ruby version: 3.0.0

* `bundle install`
    - RAILS ~> 6.1.3
    - PG ~> 1.1
    - PUMA ~> 5.0


* Database : `rails db:create db:migrate`
  > des seeds sont présentes dans les migrations pour setup les mots de passes globaux

* TESTS : `rspec`
  * Dependencies:
    - Capybara
    - FactoryBot
    - FFaker
    - Database Cleaner
  


* CODE: 
  [GITHUB](https://github.com/jpmagido/la-mission-parfaite)
    - MASTER BRANCH
    - DELIVERY BRANCH
  
  
* PROJET: 
  [TRELLO](https://trello.com/b/XsGM2sNn/roro-app-city-gang)

    - HEROKU

___________
___________

* Pour participer au Projet:

- Ouvrir une pull request
- Copier la description de la carte dans la PR
- Demander une review

* Les pré-requis:

- Tester son code
- Unitaire et Intégration (en bonus les tests fonctionnels)
- Respecter l'architecture REST au maximum
- Faire en sorte que le code soit explicite
- (rubocop arrive bientot !!)

Cela vous ouvre le droit à des reviews de code complètes et détaillés qui vont avec les commentaires écrits

Peace :yum:

