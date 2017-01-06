# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string
#  rotc_class :integer          default("0")
#  cc         :boolean          default("f")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ApplicationRecord
  has_and_belongs_to_many :users

  enum rotc_class: [:gmc, :poc]
end
