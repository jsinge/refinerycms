class Admin::ProductsController < Admin::BaseController

  crudify :product, :title_attribute => :title

end
