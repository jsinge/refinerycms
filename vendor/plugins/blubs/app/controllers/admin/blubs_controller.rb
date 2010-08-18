class Admin::BlubsController < Admin::BaseController

  crudify :blub, :title_attribute => :name

end
