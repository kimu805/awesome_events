class RemoveOmniauthFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :provider, :string
    remove_column :users, :uid, :string
    remove_column :users, :image_url, :string
  end
end
