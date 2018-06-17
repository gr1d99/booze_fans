class Alcohol < ApplicationRecord
  validates :name, presence: true
  validates :vv, presence: true
end
