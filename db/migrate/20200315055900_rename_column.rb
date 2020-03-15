class RenameColumn < ActiveRecord::Migration[6.0]
  def change
    remove_reference :products, :categoroy
  end
end
