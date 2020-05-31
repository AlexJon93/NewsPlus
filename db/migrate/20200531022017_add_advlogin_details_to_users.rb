class AddAdvloginDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :remember_digest, :string
    add_column :users, :reset_digest, :string
    add_column :users, :reset_at, :datetime
  end
end
