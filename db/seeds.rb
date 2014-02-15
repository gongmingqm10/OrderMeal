# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :username => 'xiaoming', :email => 'gongmingqm10@foxmail.com', :password => '123456', :role => 'guest'
puts 'New user created: ' << user.username
user2 = User.create! :username => 'gongming', :email => 'gongmingqm10@gmail.com', :password => '123456', :role => 'admin'
puts 'New user created: ' << user2.username