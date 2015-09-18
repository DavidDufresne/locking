task mess_up_davids_vacation: :environment do
  Trip.delete_all
  davids_trip = Trip.create(destination: 'Honolulu', price: 30)

  aarons_instance = Trip.find(davids_trip.id)
  aarons_instance.update(destination: 'Hoboken')
  davids_trip.update(charged: true)

  davids_trip.reload
  p "You've been charged #{davids_trip.price} monies for your trip to #{davids_trip.destination}. Enjoy."
  # "You've been charged 30 monies for your trip to Hoboken. Enjoy."
end

task mess_up_davids_vacation_with_optimistic_locking: :environment do
  Trip.delete_all
  davids_trip = Trip.create(destination: 'Honolulu', price: 30)

  aarons_instance = Trip.find(davids_trip.id)
  aarons_instance.update(destination: 'Hoboken')
  begin
    davids_trip.update(charged: true)
  rescue ActiveRecord::StaleObjectError
    davids_trip.reload
    davids_trip.update(destination: 'Honolulu')
    davids_trip.update(charged: true)
  end

  davids_trip.reload
  p "You've been charged #{davids_trip.price} monies for your trip to #{davids_trip.destination}. Enjoy."
  # "You've been charged 30 monies for your trip to Honolulu. Enjoy."
end
