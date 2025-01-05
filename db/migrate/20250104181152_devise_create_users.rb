class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    # pgcrypto拡張を有効化（PostgreSQLを使用している場合のみ必要）
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :users, id: :uuid do |t| # idをUUIDに設定
      t.string :name, null: false, limit: 255
      t.string :email, null: false, limit: 255, index: { unique: true }
      t.timestamp :email_verified_at
      t.string :password, null: false, limit: 255
      t.string :remember_token, limit: 100
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamp :deleted_at
    end
  end
end