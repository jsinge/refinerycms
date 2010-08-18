class BlubsController < ApplicationController

  before_filter :find_all_blubs
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @blub in the line below:
    present(@page)
  end

  def show
    @blub = Blub.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @blub in the line below:
    present(@page)
  end

protected

  def find_all_blubs
    @blubs = Blub.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/blubs")
  end

end
