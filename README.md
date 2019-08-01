# README
Ce programme va générer grâce à la gem 'faker' et le fichier seeds.rb des dogsitters et des dogs puis leur assigner une date de rendez vous pour une balade dans leur ville.

La difficulté de l'exercice consistait à assigner une balade à un dogsitter et un dog habitant dans la même ville.

Pour générer des dogsitters, dogs et balades, lancer la commande "rails db:seed".

Cela permettra de remplir les tables de la BDD avec les informations contenues dans le fichier "db/seeds.rb".

Il est conseillé d'utiliser la gem 'table_print' pour afficher les tables dans la console rails avec la commande "tp Nomdelatable.all"


La table dogsitters est composée des colonnes suivantes :
* ID
* name

et chaque objet de la table sera lié à la table cities via la foreign key city_id


La table dogs est composée des colonnes suivantes :
* ID
* name

et chaque objet de la table sera lié à la table cities via la foreign key city_id


La table strolls est composée des colonnes suivantes :
* ID
* Date

et chaque objet de la table sera relié, via des foreign key, aux tables dogsitters et dogs.
Il n'est pas nécessaire de relier cette table à une key city_id puisque celui ci est déja connu via le dogsitter ou le dogs
