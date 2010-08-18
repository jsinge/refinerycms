class Admin::BlasController < Admin::BaseController

  crudify :bla, :title_attribute => :test

end
