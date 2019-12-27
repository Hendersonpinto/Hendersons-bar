class AddPopularToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :popular, :boolean, default: false
  end
end
