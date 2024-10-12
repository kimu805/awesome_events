class AddOmniauthToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :uid, :string, null: false
    add_column :users, :provider, :string, null: false
    add_column :users, :image_url, :string, null: false

    add_index :users, [:uid, :provider], unique: true
  end
end
