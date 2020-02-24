# frozen_string_literal: true

# products controller
class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :classification_option, only: %i[new edit]
  before_action :authenticate_user!, except: %i[index show]
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
    redirect_to products_url, notice: t('product_number', number: @product.product_number, name: @product.product_name) + t('msg.update')
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: "「品番#{@product.product_number}:#{@product.product_name}」を削除しました。"
  end

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
  #     redirect_to products_url, notice: '規格品を追加しました'
  #   end

  private

  def product_params
    params.require(:product).permit(:product_name, :product_number, :page, :classification, :discontinued, :unit_name, :price, :remark, :unit, :image, :user_id, :created_at, :updated_at)
  end

  def set_product
    @product = Product.find(params[:id])
  end


  def classification_option
    @classification_option = [
        %W(規格完成品 規格完成品),
        %W(ポテサラ赤スパ盛等 ポテサラ･赤スパ盛等),
        %W(玉子 玉子),
        %W(フライ類 フライ類),
        %W(肉･肉製品 肉･肉製品),
        %W(パン･サンドイッチ パン･サンドイッチ),
        %W(魚介 魚介),
        %W(中華部品 中華部品),
        %W(天ぷら 天ぷら),
        %W(焼魚･うなぎ蒲焼き 焼魚･うなぎ蒲焼き),
        %W(おでん･焼鳥 おでん･焼鳥),
        %W(和食部品 和食部品),
        %W(漬物 漬物),
        %W(刺身･寿司ネタ 刺身･寿司ネタ),
        %W(薬味 薬味),
        %W(笹の葉･ハラン 笹の葉･ハラン),
        %W(和食カット部品 和食カット部品),
        %W(手巻寿司 手巻寿司),
        %W(握り寿司 握り寿司),
        %W(巻寿司 巻寿司),
        %W(押し寿司 押し寿司),
        %W(麺･パスタ 麺･パスタ),
        %W(米 米),
        %W(野菜 野菜),
        %W(飾り葉 飾り葉),
        %W(喫茶部品 喫茶部品),
        %W(果物･野菜一個物 果物･野菜一個物),
        %W(ソフトクリーム部品 ソフトクリーム部品),
    ]
  end
end
