# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

data = CSV.open('./db/data/vehicles.csv', headers: true, header_converters: :symbol)

Vehicle.all.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!(:vehicles)

def populate_database(vehicle_data)
  vehicle_data.each do |vehicle|
    if vehicle[:fueltype].include?('Electricity')
      Vehicle.create!(
        record_id: vehicle[:id],
        make: vehicle[:make],
        model: vehicle[:model],
        year: vehicle[:year],
        fuel_type: vehicle[:fueltype],
        range: vehicle[:range],
        mpge: vehicle[:comba08] || vehicle[:comb08],
        charge120: vehicle[:charge120],
        charge240: vehicle[:charge240]
      )
      puts "#{vehicle[:make]} #{vehicle[:model]} created"
    end
  end
  puts "#{Vehicle.count} electric vehicles created"
end

populate_database(data)
