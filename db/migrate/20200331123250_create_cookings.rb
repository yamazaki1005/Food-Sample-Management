class CreateCookings < ActiveRecord::Migration[6.0]
  def change
    create_table :cookings do |t|
      t.string :cooking_name
      t.bigint :category_id

      t.timestamps
    end
  end
end
