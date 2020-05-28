class AddVerificationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :verification, :string
  end
end
