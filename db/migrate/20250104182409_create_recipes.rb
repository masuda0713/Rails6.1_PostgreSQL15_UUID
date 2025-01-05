class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes, id: :uuid do |t|
      t.uuid :user_id
      t.bigint :category_id
      t.string :title, null: false
      t.text :description, null: false
      t.text :image
      t.bigint :views, default: 0, null: false
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }, null: false
      t.datetime :deleted_at
    end

    add_foreign_key :recipes, :users, column: :user_id
    add_foreign_key :recipes, :categories, column: :category_id
    add_index :recipes, :user_id
    add_index :recipes, :category_id
  end
end