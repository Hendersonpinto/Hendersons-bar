class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  # validates :cocktail, :scope => [:ingredient], uniqueness:true
  validates_uniqueness_of :cocktail, :scope => [:ingredient]


end
