class CreateCocktails < ActiveRecord::Migration[5.2]
    def change
      create_table :cocktails do |t|
        t.string :name
        t.references :owner, foreign_key: { to_table: :users }
        t.timestamps
      end
    end
  end