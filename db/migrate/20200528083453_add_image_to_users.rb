class AddImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_id, :string
    add_column :users, :city, :string
    add_column :users, :intro, :text
  end
end
