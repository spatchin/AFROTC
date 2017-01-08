# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string
#  category   :string
#  location   :string
#  date       :datetime
#  mandatory  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  creator_id :integer
#
# Indexes
#
#  index_events_on_creator_id  (creator_id)
#

FactoryGirl.define do
  factory :event do
    type ""
    user nil
  end
end
