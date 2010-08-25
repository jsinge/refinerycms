class Admin::CategoriesController < Admin::BaseController

  crudify :category, :title_attribute => :title,
          :order => "position ASC",
          :paging => false
          
end
