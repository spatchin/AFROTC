# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  User.destroy_all
  Role.destroy_all
  Flight.destroy_all
  Event.destroy_all

  admin = User.new({email: 'admin@email.com', name: 'admin', password: 'password', password_confirmation: 'password'})
  admin.skip_invitation
  admin.add_role :admin
  admin.save!
  p admin

  wingCC = User.new({email: 'wingcc@email.com', name: 'wing/cc', password: 'password', password_confirmation: 'password'})
  wingCC.skip_invitation
  wingCC.add_role :poc
  wingCC.save!
  p wingCC  

  groupCC = User.new({email: 'groupcc@email.com', name: 'group/cc', password: 'password', password_confirmation: 'password'})
  groupCC.skip_invitation
  groupCC.add_role :poc
  groupCC.save!
  p groupCC

  flight = Flight.create(name: 'Alpha')

  flightCC = User.new({email: 'flight1_cc@email.com', name: 'flight1/cc', password: 'password', password_confirmation: 'password'})
  flightCC.skip_invitation
  flightCC.add_role :poc
  flightCC.add_role :cc, flight
  flightCC.save!
  flight.cadets << flightCC
  p flightCC

  poc = User.new({email: 'poc@email.com', name: 'poc', password: 'password', password_confirmation: 'password'})
  poc.skip_invitation
  poc.add_role :poc
  poc.save!
  p poc  

  (1..10).each do |i|
    llab = Event.new({name: "LLAB #{i}", category: 'LLAB', date: Time.now})
    llab.creator = admin
    llab.save!
    p llab

    pt = Event.new({name: "PT #{i}", category: 'PT', date: Time.now})
    pt.creator = admin
    pt.save!
    p pt

    gmc = User.new({email: "gmc_#{i}@email.com", name: "gmc_#{i}", password: 'password', password_confirmation: 'password'})
    gmc.skip_invitation
    gmc.add_role :gmc
    gmc.save!
    flight.cadets << gmc
    p gmc
  end
elsif Rails.env.production?
  admin = User.new({email: 'admin@email.com', name: 'admin', password: 'password', password_confirmation: 'password'})
  admin.skip_invitation
  admin.add_role :admin
  admin.save!
  p admin

  wingCC = User.new({email: 'wingcc@email.com', name: 'wing/cc', password: 'password', password_confirmation: 'password'})
  wingCC.skip_invitation
  wingCC.add_role :poc
  wingCC.save!
  p wingCC  

  groupCC = User.new({email: 'groupcc@email.com', name: 'group/cc', password: 'password', password_confirmation: 'password'})
  groupCC.skip_invitation
  groupCC.add_role :poc
  groupCC.save!
  p groupCC

  flight = Flight.create(name: 'Alpha')

  flightCC = User.new({email: 'flight1_cc@email.com', name: 'flight1/cc', password: 'password', password_confirmation: 'password'})
  flightCC.skip_invitation
  flightCC.add_role :poc
  flightCC.add_role :cc, flight
  flightCC.save!
  flight.cadets << flightCC
  p flightCC

  poc = User.new({email: 'poc@email.com', name: 'poc', password: 'password', password_confirmation: 'password'})
  poc.skip_invitation
  poc.add_role :poc
  poc.save!
  p poc  

  (1..10).each do |i|
    llab = Event.new({name: "LLAB #{i}", category: 'LLAB', date: Time.now})
    llab.creator = admin
    llab.save!
    p llab

    pt = Event.new({name: "PT #{i}", category: 'PT', date: Time.now})
    pt.creator = admin
    pt.save!
    p pt

    gmc = User.new({email: "gmc_#{i}@email.com", name: "gmc_#{i}", password: 'password', password_confirmation: 'password'})
    gmc.skip_invitation
    gmc.add_role :gmc
    gmc.save!
    flight.cadets << gmc
    p gmc
  end
end
