# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
# Supprime toutes les villes existantes et crée aléatoirement via la gem faker 5 noms de villes
City.destroy_all
5.times do |index|
  City.create!(
  city_name: Faker::Address.city)
end

#Supprime tous les dogsitters
Dogsitter.destroy_all
#Fais 50 fois l'actions ci dessous
50.times do |index|
  #Crée un dogsitter
  Dogsitter.create!(
  #Lui donne un nom et prénom
  name: Faker::Name.name,
  #Lui une ville au hasard parmis les villes existantes
  city: City.all.sample)
end

#SUpprime les dogs existants et créer 20 chiens puis leur assigne un nom et une ville au hasard
Dog.destroy_all
20.times do |index|
  Dog.create!(
  name: Faker::Creature::Dog.name,
  city: City.all.sample)
end


10.times do |index|
  #Sélectionne au hasard un dogsitter
  dogsitter_match = Dogsitter.all.sample
  #Sélectionne au hasard un dog
  dog_match = Dog.all.sample
  #Tant que le dogsitter selectionné et le dog selectionné ne sont pas dans la même ville
  while dogsitter_match.city != dog_match.city
    #On change de dog
    dog_match = Dog.all.sample
  end
  #Créer un Stroll
  Stroll.create!(
    #Avec le dogsitter selectionné au hasard
    dogsitter: dogsitter_match,
    #Et le dog qui a permis de sortir de la boucle while
    dog: dog_match,
    #Donne une date et heure de rdv pour promener le chien
    date: Faker::Time.forward(days: 30, period: :day).to_datetime
    )
  end
