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

require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
