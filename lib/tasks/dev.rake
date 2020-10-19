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
        CarModel.find_or_create_by!(
          name: Faker::Vehicle.model,
          manufacturer: manufacturer
        )
      end
    end

    CarModel.all.each do |car|
      Vehicle.create!(
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
        car_model: car
      )
    end

    Vehicle.all.each do |vehicle|
      Sale.create!(
        sold: Faker::Boolean.boolean,
        vehicle: vehicle
      )
    end

  end

end
