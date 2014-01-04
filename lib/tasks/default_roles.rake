desc 'Create default roles in the database'
task :create_roles => :environment do
  Role.create(name: 'Reader') unless Role.exists?(name: 'Reader')
  Role.create(name: 'Marker Manager') unless Role.exists?(name: 'Marker Manager')
  Role.create(name: 'Buildings Manager') unless Role.exists?(name: 'Buildings Manager')
  Role.create(name: 'Reservations Manager') unless Role.exists?(name: 'Reservations Manager')
end