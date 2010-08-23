class Admin::ProductsController < Admin::BaseController

  crudify :product, :title_attribute => :title,
    :include => [:shop],
    :conditions => 'shops.user_id = #{current_user.id}',
    :order => 'shops.position,products.position ASC'

end
