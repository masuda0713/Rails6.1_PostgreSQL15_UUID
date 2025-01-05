class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.uuid :recipe_id, null: false
      t.string :name, null: false
      t.string :quantity, null: false
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }, null: false
    end

    add_foreign_key :ingredients, :recipes, column: :recipe_id
    add_index :ingredients, :recipe_id
  end
end
