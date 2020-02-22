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
    @classification_option = [%W[\u898F\u683C\u5B8C\u6210\u54C1 \u898F\u683C\u5B8C\u6210\u54C1],
                              ['ポテサラ・赤スパ盛等', 'ポテサラ・赤スパ盛等'],
                              %W[\u7389\u5B50 \u7389\u5B50],
                              %W[\u30D5\u30E9\u30A4\u985E \u30D5\u30E9\u30A4\u985E],
                              ['肉・肉製品', '肉・肉製品'],
                              %W[\u8868\u793A\u30C6\u30B9\u30C8 \u8868\u793A\u30C6\u30B9\u30C8],
                              ['パン・サンドイッチ', 'パン・サンドイッチ'],
                              %W[\u9B5A\u4ECB \u9B5A\u4ECB],
                              %W[\u4E2D\u83EF\u90E8\u54C1 \u4E2D\u83EF\u90E8\u54C1],
                              %W[\u5929\u3077\u3089 \u5929\u3077\u3089],
                              ['焼魚・うなぎ蒲焼き', '焼魚・うなぎ蒲焼き'],
                              ['おでん・焼鳥', 'おでん・焼鳥'],
                              %W[\u548C\u98DF\u90E8\u54C1 \u548C\u98DF\u90E8\u54C1],
                              %W[\u6F2C\u7269 \u6F2C\u7269],
                              ['刺身・寿司ネタ', '刺身・寿司ネタ'],
                              %W[\u85AC\u5473 \u85AC\u5473],
                              ['笹の葉・ハラン', '笹の葉・ハラン'],
                              %W[\u548C\u98DF\u30AB\u30C3\u30C8\u90E8\u54C1 \u548C\u98DF\u30AB\u30C3\u30C8\u90E8\u54C1],
                              %W[\u624B\u5DFB\u5BFF\u53F8 \u624B\u5DFB\u5BFF\u53F8],
                              %W[\u63E1\u308A\u5BFF\u53F8 \u63E1\u308A\u5BFF\u53F8],
                              %W[\u5DFB\u5BFF\u53F8 \u5DFB\u5BFF\u53F8],
                              %W[\u62BC\u3057\u5BFF\u53F8 \u62BC\u3057\u5BFF\u53F8],
                              ['麺・パスタ', '麺・パスタ'], %W[\u7C73 \u7C73],
                              %W[\u91CE\u83DC \u91CE\u83DC],
                              %W[\u98FE\u308A\u8449 \u98FE\u308A\u8449],
                              %W[\u55AB\u8336\u90E8\u54C1 \u55AB\u8336\u90E8\u54C1],
                              ['果物・野菜一個物', '果物・野菜一個物'],
                              %W[\u30BD\u30D5\u30C8\u30AF\u30EA\u30FC\u30E0\u90E8\u54C1 \u30BD\u30D5\u30C8\u30AF\u30EA\u30FC\u30E0\u90E8\u54C1]]
  end
end
