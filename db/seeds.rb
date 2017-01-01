# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  User.destroy_all

  admin = User.new({email: 'admin@email.com', name: 'admin', password: 'password', password_confirmation: 'password'})
  admin.skip_invitation
  admin.save!
  admin.roles << Role.where(name: 'admin').first_or_create
  p admin

  wingCC = User.new({email: 'wingcc@email.com', name: 'wing/cc', password: 'password', password_confirmation: 'password'})
  wingCC.skip_invitation
  wingCC.save!
  wingCC.roles += [Role.where(name: 'poc').first_or_create, Role.where(name: 'wing_cc').first_or_create]
  p wingCC  

  groupCC = User.new({email: 'groupcc@email.com', name: 'group/cc', password: 'password', password_confirmation: 'password'})
  groupCC.skip_invitation
  groupCC.save!
  groupCC.roles += [Role.where(name: 'poc').first, Role.where(name: 'msg_cc').first_or_create]
  p groupCC

  flightCC = User.new({email: 'flight1_cc@email.com', name: 'flight1/cc', password: 'password', password_confirmation: 'password'})
  flightCC.skip_invitation
  flightCC.save!
  flightCC.roles += [Role.where(name: 'poc').first, Role.where(name: 'aflight_cc').first_or_create]
  p flightCC

  flightCC = User.new({email: 'flight2_cc@email.com', name: 'flight2/cc', password: 'password', password_confirmation: 'password'})
  flightCC.skip_invitation
  flightCC.save!
  flightCC.roles += [Role.where(name: 'poc').first, Role.where(name: 'bflight_cc').first_or_create]
  p flightCC

  poc = User.new({email: 'poc@email.com', name: 'poc', password: 'password', password_confirmation: 'password'})
  poc.skip_invitation
  poc.save!
  poc.roles << Role.where(name: 'poc').first
  p poc  

  (1..10).each do |i|
    llab = Event.create({name: "LLAB #{i}", category: 'LLAB', date: Time.now})
    pt = Event.create({name: "PT #{i}", category: 'PT', date: Time.now})
  
    gmc = User.new({email: "gmc_#{i}@email.com", name: "gmc_#{i}", password: 'password', password_confirmation: 'password'})
    gmc.skip_invitation
    gmc.save!
    gmc.roles << Role.where(name: 'gmc').first_or_create
    p gmc
  end
elsif Rails.env.production?
  ROLE_NAMES = %w(gmc poc cadre admin aflight_cc bflight_cc cflight_cc dflight_cc msg_cc wing_cc)
  ROLE_NAMES.each { |name| Role.create(name: name) }
end
