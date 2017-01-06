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

  admin = User.new({email: 'admin@email.com', name: 'admin', password: 'password', password_confirmation: 'password'})
  admin.skip_invitation
  admin.roles << Role.where(name: 'admin', rotc_class: 'poc').first_or_create
  admin.save!
  p admin

  wingCC = User.new({email: 'wingcc@email.com', name: 'wing/cc', password: 'password', password_confirmation: 'password'})
  wingCC.skip_invitation
  wingCC.roles << Role.where(name: 'wing', rotc_class: 'poc', cc: true).first_or_create
  wingCC.save!
  p wingCC  

  groupCC = User.new({email: 'groupcc@email.com', name: 'group/cc', password: 'password', password_confirmation: 'password'})
  groupCC.skip_invitation
  groupCC.roles << Role.where(name: 'group', rotc_class: 'poc', cc: true).first_or_create
  groupCC.save!
  p groupCC

  flightCC = User.new({email: 'flight1_cc@email.com', name: 'flight1/cc', password: 'password', password_confirmation: 'password'})
  flightCC.skip_invitation
  flightCC.roles << Role.where(name: 'flight1', rotc_class: 'poc', cc: true).first_or_create
  flightCC.save!
  p flightCC

  flightCC = User.new({email: 'flight2_cc@email.com', name: 'flight2/cc', password: 'password', password_confirmation: 'password'})
  flightCC.skip_invitation
  flightCC.roles << Role.where(name: 'flight2', rotc_class: 'poc', cc: true).first_or_create
  flightCC.save!
  p flightCC

  poc = User.new({email: 'poc@email.com', name: 'poc', password: 'password', password_confirmation: 'password'})
  poc.skip_invitation
  poc.roles << Role.where(name: 'poc', rotc_class: 'poc').first_or_create
  poc.save!
  p poc  

  (1..10).each do |i|
    llab = Event.create({name: "LLAB #{i}", category: 'LLAB', date: Time.now})
    pt = Event.create({name: "PT #{i}", category: 'PT', date: Time.now})
  
    gmc = User.new({email: "gmc_#{i}@email.com", name: "gmc_#{i}", password: 'password', password_confirmation: 'password'})
    gmc.skip_invitation
    gmc.roles << Role.where(name: '100', rotc_class: 'gmc').first_or_create
    gmc.save!
    p gmc
  end
elsif Rails.env.production?
  ROLE_NAMES = %w(gmc poc cadre admin aflight_cc bflight_cc cflight_cc dflight_cc msg_cc wing_cc)
  ROLE_NAMES.each { |name| Role.create(name: name) }
end
