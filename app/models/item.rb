class Item < ApplicationRecord
  belongs_to :room
  validates :name, presence:

end
