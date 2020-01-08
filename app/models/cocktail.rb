class Cocktail < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search_by_name_category, against: [:name, :category]
    has_many :doses, dependent: :destroy
    has_many :ingredients, through: :doses
    belongs_to :owner, class_name: 'User'
    validates :name, uniqueness:true, presence:true
    pg_search_scope :global_search,
    against: [:name, :category],
    associated_against: {
      ingredients: [:name]
    }
  end