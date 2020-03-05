# frozen_string_literal: true

# Categories
class Categories < ActiveRecord::Migration[6.0]
  def up
    classification_names = [
      '規格完成品',
      'ポテサラ赤スパ盛等',
      '玉子',
      'フライ類',
      '肉･肉製品',
      'パン･サンドイッチ',
      '魚介',
      '中華部品',
      '天ぷら',
      '焼魚･うなぎ蒲焼き',
      'おでん･焼鳥',
      '和食部品',
      '漬物',
      '刺身･寿司ネタ',
      '薬味',
      '笹の葉･ハラン',
      '和食カット部品',
      '手巻寿司',
      '握り寿司',
      '巻寿司',
      '押し寿司',
      '麺･パスタ',
      '米',
      '野菜',
      '飾り葉',
      '喫茶部品',
      '果物･野菜一個物',
      'ソフトクリーム部品'
    ]
    classification_names.each do |n|
      Category.create(classification_name: n)
    end
  end

  def down
    Category.delete_all
  end
end
