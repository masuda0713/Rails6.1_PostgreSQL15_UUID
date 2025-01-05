class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|
      t.uuid :recipe_id, null: false
      t.integer :step_number, null: false
      t.text :description, null: false
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }, null: false
    end

    add_foreign_key :steps, :recipes, column: :recipe_id
    add_index :steps, [:recipe_id, :step_number], unique: true
  end
end