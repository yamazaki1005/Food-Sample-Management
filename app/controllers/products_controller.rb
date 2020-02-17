class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  PAGE_LIMIT_NUMBER = 30

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

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

end
