class AddForeignkeyToCookings < ActiveRecord::Migration[6.0]
  def change
    add_column :cookings, :user_id, :integer
  end
end
