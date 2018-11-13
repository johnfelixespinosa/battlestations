class AddUserIdToBattlestations < ActiveRecord::Migration[5.2]
  def change
    add_column :battlestations, :user_id, :integer
  end
end
