class Admin::ProductsController < Admin::BaseController

  crudify :product
  limit_to_shop :product

end
