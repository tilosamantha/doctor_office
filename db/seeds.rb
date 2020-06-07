# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


specialties = ['Pediatrician', 'Dermatologist', 'Gynocologist', 'Cardilogist', 'ENT', 'Plastic Surgeon']
7.times do     #creates 10 things
  doctor = Doctor.create(
    last_name: Faker::TvShows::GameOfThrones.character,
    specialty: specialties.sample
  )


  5.times do
    patient = Patient.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Movies::HarryPotter.spell
    )

    2.times do
      appointment = Appointment.create(
        day: Faker::Number.within(range: 1..31),
        month: Faker::Number.within(range: 1..12)
      )
    end
  end
end
puts 'data seeded' 