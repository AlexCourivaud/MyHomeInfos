class Room < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :paintings, dependent: :destroy
end
