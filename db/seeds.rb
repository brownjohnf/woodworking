# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

roles = Role.create!([{:name => 'User'},{:name => 'Moderator'},{:name => 'Admin'}])
admin = User.new(:name => 'Admin User', :email => 'admin@admin.com', :password => 'admin123')
admin.save!
admin.roles << Role.find(1)
admin.roles << Role.find(2)
admin.roles << Role.find(3)
