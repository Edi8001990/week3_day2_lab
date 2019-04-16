require('pry-byebug')
require_relative('models/property_tracker')


PropertyTracker.delete_all()

property1 = PropertyTracker.new('address' => 'Morningside st. 45', 'number_of_rooms' => '5', 'build_type' => 'Detached', 'year_built' => '2008')
property2 = PropertyTracker.new('address' => 'Castle Terrace 100', 'number_of_rooms' => '3', 'build_type' => 'Flat', 'year_built' => '2015')

property1.save()
property2.save()
property2.delete()
property1.address = "New Street 2.0 42"
property1.update
