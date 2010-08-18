class BlasController < ApplicationController

  before_filter :find_all_blas
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @bla in the line below:
    present(@page)
  end

  def show
    @bla = Bla.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @bla in the line below:
    present(@page)
  end

protected

  def find_all_blas
    @blas = Bla.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/blas")
  end

end
