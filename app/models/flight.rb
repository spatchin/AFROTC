# == Schema Information
#
# Table name: flights
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Flight < ApplicationRecord
  has_many :cadets, class_name: 'User'
end
