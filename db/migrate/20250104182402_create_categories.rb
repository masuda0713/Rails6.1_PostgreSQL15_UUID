class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false, unique: true
      t.text :description
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }, null: false
    end

    add_index :categories, :name, unique: true
  end
end
