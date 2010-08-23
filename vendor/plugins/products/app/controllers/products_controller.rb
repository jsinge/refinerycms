class ProductsController < ApplicationController

  before_filter :find_all_products
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @product in the line below:
    present(@page)
  end

  def show
    @product = Product.find(params[:id])
    @shop = @product.shop
    # more products from same shop:
    # todo: maximal 3 produkte anzeigen, evtl nach kriterien wie tag-ähnlichkeit oder beliebtheit auswählen
    @more_products= @product.shop.products
    @similar_products = Product.find(:all, :limit => 3, :order => "random() ASC")

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @product in the line below:
    present(@page)
  end

protected

  def find_all_products
    @products = Product.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/products")
  end

end
