# == Schema Information
#
# Table name: flights
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :flight do
    cadets ""
  end
end
