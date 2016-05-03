# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    User.create!(:username => 'talha', :password => '123')
    # User.create!(:username => 'muazzam', :password => '456')
    
    # @c1 = Course.create! ({:code => "CS300", :instructor => "Shayan",
    #     :stime => Time.now, :etime => Time.now, days: "Monday Tuesday ", venue: "Auditorium A-2"})