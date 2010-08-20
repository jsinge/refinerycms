class Admin::ShopsController < Admin::BaseController

  crudify :shop, :title_attribute => :title

end
