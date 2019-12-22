class Ingredient < ApplicationRecord
  has_many :doses
  # has_one :cocktail, through: :doses

  validates :name, uniqueness:true, presence:true
end
