class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.uuid :user_id, null: false
      t.uuid :recipe_id, null: false
      t.integer :rating, limit: 1, null: false
      t.text :comment
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }, null: false
      t.datetime :deleted_at
    end

    add_foreign_key :reviews, :users, column: :user_id
    add_foreign_key :reviews, :recipes, column: :recipe_id
    add_index :reviews, :user_id
    add_index :reviews, :recipe_id
  end
end
