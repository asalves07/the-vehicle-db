namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do

    10.times do |i|
      Manufacturer.find_or_create_by!(
        name: Faker::Vehicle.manufacture
      )
    end

    Manufacturer.all.each do |manufacturer|
      rand(5).times do |i|
        Vehicle.create!(
          car_model: Faker::Vehicle.model,
          color: Faker::Vehicle.color,
          transmission: Faker::Vehicle.transmission,
          drive_type: Faker::Vehicle.drive_type,
          fuel_type: Faker::Vehicle.fuel_type,
          car_type: Faker::Vehicle.car_type,
          door: Faker::Vehicle.door_count,
          engine: Faker::Vehicle.engine_size,
          year: Faker::Vehicle.year,
          kilometrage: Faker::Vehicle.kilometrage,
          plate: Faker::Vehicle.license_plate,
          manufacturer: manufacturer
        )
      end
    end

    Vehicle.all.each do |car|
      Sale.create!(
        sold: Faker::Boolean.boolean,
        vehicle: car
      )
    end

  end

end
