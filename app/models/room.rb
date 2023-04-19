class Room < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :paintings, dependent: :destroy
  accepts_nested_attributes_for :paintings


  validates :name, presence: true

end
