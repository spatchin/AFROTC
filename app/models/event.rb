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

class Event < ApplicationRecord
  has_and_belongs_to_many :users

  belongs_to :creator, class_name: 'User'

  def created_by?(user)
    return false unless user
    creator == user
  end
end
