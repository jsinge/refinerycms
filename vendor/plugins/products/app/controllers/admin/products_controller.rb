class Admin::ProductsController < Admin::BaseController

  crudify :product, :title_attribute => :title,
    :include => [:shop],
    :conditions => 'shops.user_id = #{current_user.id}',
    :order => 'shops.position,products.position ASC'

  before_filter :get_categories, :only => [:edit, :update, :new]
  def get_categories
    if params[:shop_id]
      @shop = Shop.find params[:shop_id]
    elsif @product
      @shop = @product.shop
    else
      @shop = current_user.shops.first
    end
    @categories = @shop.list_categories
  end


end
