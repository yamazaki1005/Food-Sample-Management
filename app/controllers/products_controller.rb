# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :classification_option, only: %i[new edit]
  PAGE_LIMIT_NUMBER = 30

  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)
    @product.save!
    redirect_to products_path, notice: "規格品「#{@product.product_name}」を登録しました。"
  end

  def update
    @product.update!(product_params)
    redirect_to products_url, notice: "「品番#{@product.product_number}:#{@product.product_name}」を更新しました。"
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: "「品番#{@product.product_number}:#{@product.product_name}」を削除しました。"
  end

  #  流用コード
  #   def self.ransackable_attributes(auth_object = nil)
  #     %w[product_name product_number page classification discontinued price created_at updated_at]
  #   end
  #
  #   def self.ransackable_associations(auth_object = nil)
  #     []
  #   end
  #
  #   def detailed_list
  #     @products = Product.ransack(params[:q]).result(product_name: true).page(params[:page]).per(PAGE_LIMIT_NUMBER).order(created_at: :desc)
  #
  #   end
  #
  #   def import
  #     current_user.products.import(params[:file])
  #     redirect_to products_url, notice: "規格品を追加しました"
  #   end

  private

  def product_params
    params.require(:product).permit(:product_name, :product_number, :page, :classification, :discontinued, :unit_name, :price, :remark, :unit, :image, :user_id, :created_at, :updated_at)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def classification_option
    @classification_option = [["規格完成品", "規格完成品"],
             ["ポテサラ・赤スパ盛等", "ポテサラ・赤スパ盛等"],
             ["玉子", "玉子"],
             ["フライ類", "フライ類"],
             ["肉・肉製品", "肉・肉製品"],
             ["パン・サンドイッチ", "パン・サンドイッチ"],
             ["魚介", "魚介"],
             ["中華部品", "中華部品"],
             ["天ぷら", "天ぷら"],
             ["焼魚・うなぎ蒲焼き", "焼魚・うなぎ蒲焼き"],
             ["おでん・焼鳥", "おでん・焼鳥"],
             ["和食部品", "和食部品"],
             ["漬物", "漬物"],
             ["刺身・寿司ネタ", "刺身・寿司ネタ"],
             ["薬味", "薬味"],
             ["笹の葉・ハラン", "笹の葉・ハラン"],
             ["和食カット部品", "和食カット部品"],
             ["手巻寿司", "手巻寿司"],
             ["握り寿司", "握り寿司"],["巻寿司", "巻寿司"],
             ["押し寿司", "押し寿司"],
             ["麺・パスタ", "麺・パスタ"],["米", "米"],
             ["野菜", "野菜"],
             ["飾り葉", "飾り葉"],["喫茶部品", "喫茶部品"],
             ["果物・野菜一個物", "果物・野菜一個物"],
             ["ソフトクリーム部品", "ソフトクリーム部品"]]
  end
end
