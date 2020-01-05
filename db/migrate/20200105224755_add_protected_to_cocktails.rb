class AddProtectedToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :protected, :boolean, default: false
  end
end
