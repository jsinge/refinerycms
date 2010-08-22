class Admin::ShopsController < Admin::BaseController

  crudify :shop, :title_attribute => :title,
    :conditions => '{ :user_id => current_user }'

end
