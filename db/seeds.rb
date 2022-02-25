#Appel la gem faker pour créer des faux profils
require 'faker'
require 'date'

#destroy all data from class
User.destroy_all
Attendance.destroy_all
Event.destroy_all


#Création de 10 users 
10.times do |t|
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: "Personne intéressé pour rencontrer d'autres gens aux évènements",
    password: "Faker::Lorem.sentence",
    email: "email#{t}@yopmail.com"
  );
end


#Création de 10 event 
15.times do |t|
  event = Event.create!(
    start_date: Date.tomorrow,
    duration: 25,
    title: "event#{t}",
    description: "incroyable event organisé par un inconnu venez nombreux",
    price: rand(1..1000),
    location: Faker::Address.street_address,
    admin_id: User.all.sample.id
    );
end


#création de 10 attendances
10.times do 
  attendance = Attendance.create!(
    #stripe_customer_id: #element,
    user_id: User.all.sample.id,
    event_id: Event.all.sample.id
  );
end

