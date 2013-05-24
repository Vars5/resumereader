# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



User.create(email: "team@resumequery.com", :password => 'munchable2', :password_confirmation => 'munchable2', :first_name =>
              'Team', :last_name => 'ResumeQuery', :role => 'admin')