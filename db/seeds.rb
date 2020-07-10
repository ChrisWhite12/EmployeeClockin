# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

for i in 1..10
    Employee.create([
        fname: Faker::Name.first_name,
        lname: Faker::Name.last_name,
        age: rand(18..40),
        hrrate: (rand(18.0..40.0)).ceil(2),
        card_status: ""]
    )
    puts "created #{i} records \n"
end

for i in 1..4
    Card.create(card_value: "CARD#{i}", employee_id: i)

    for j in 1..5
        Report.create(report_date_in: "#{j}/07/2020", report_date_out: "#{j}/07/2020",
        report_time_in: "#{(rand(6..8)).ceil}:00", report_time_out: "#{(rand(15..17)).ceil}:00",
        report_type: "Clock-Out", card_id: i)
    end
    
end

