class AddRemarkToCookings < ActiveRecord::Migration[6.0]
  def change
    add_column :cookings, :remark, :text
  end
end
