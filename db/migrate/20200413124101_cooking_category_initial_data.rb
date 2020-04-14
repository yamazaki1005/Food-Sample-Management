class CookingCategoryInitialData < ActiveRecord::Migration[6.0]
  def up
    names = [
      '和食',
      '洋食',
      '中華',
      'エスニック',
      'アジア',
      'カフェ・スイーツ',
      '菓子',
      'おせち'
    ]
    names.each do |m|
      CookingCategory.create(classification_name: m)
    end
  end

  def down
    CookingCategory.delete_all
  end
end
