class CookingCategoryInitialData < ActiveRecord::Migration[6.0]
  def up
    names = [
      '和食',
      '洋食',
      '中華',
      'エスニック',
      'アジア料理',
      'カフェ・スイーツ',
      '菓子',
      '匠の技'
    ]
    names.each do |m|
      CookingCategory.create(classification_name: m)
    end
  end

  def down
    CookingCategory.delete_all
  end
end
