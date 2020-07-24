# frozen_string_literal: true

# app_whole_manage_due_to_class
class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery with: :exception
  before_action :set_search_query

  private

  def set_product_categories
    @product_categories = ProductCategory.all.map{|n| [n.classification_name, n.id]}
  end

  def set_filter_product_categories
    @filter_product_categories = ProductCategory.all.map{|n| [n.classification_name, n.id]}
    # @filter_product_categories = ProductCategory.find(23,22,24,5,7,4,3,6,8,9,12,13,15,26,28).map{|n| [n.classification_name, n.id]}
    # よく使う食材分類だけ選択可能
    # 1'規格完成品',
    # 2'ポテサラ赤スパ盛等', @product_categories = ProductCategory.all.map{|n| [n.classification_name, n.id]}
    # 3'玉子',
    # 4'フライ類',
    # 5'肉･肉製品',
    # 6'パン･サンドイッチ',
    # 7'魚介',
    # 8'中華部品',
    # 9'天ぷら',
    # 10'焼魚･うなぎ蒲焼き',
    # 11'おでん･焼鳥',
    # 12'和食部品',
    # 13'漬物',
    # 14'刺身･寿司ネタ',
    # 15'薬味',
    # 16'笹の葉･ハラン',
    # 17'和食カット部品',
    # 18'手巻寿司',
    # 19'握り寿司',
    # 20'巻寿司',
    # 21'押し寿司',
    # 22'麺･パスタ',
    # 23'米',
    # 24'野菜',
    # 25'飾り葉',
    # 26'喫茶部品',
    # 27'果物･野菜一個物',
    # 28'ソフトクリーム部品'
  end

  def set_cooking_categories
    @cooking_categories = CookingCategory.all.map{|n| [n.classification_name, n.id]}
  end

  def set_all_cooking_categories
    @all_cooking_categories = CookingCategory.all
  end

  def set_search_query
    @q = current_user.products.ransack(params[:q]) if session[:user_id]
    @products = @q.result(products_number: true) if session[:user_id]
  end

  def set_cookings
    @cookings = Cooking.all
  end

  def set_products
    @products = Product.all
  end

  def set_user
    @user = current_user
  end

  def correct_user
    @correct_user = User.find(params[:id])
    if @correct_user != current_user && !current_user.admin?
      redirect_to root_path, notice: t('msg.Do_not_access_posts_list')
    end
  end
end
