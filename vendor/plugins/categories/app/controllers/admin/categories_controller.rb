class Admin::CategoriesController < Admin::BaseController

  crudify :category, :title_attribute => :title,
          :conditions => "'categories'.parent_id IS NULL",
          :order => "position ASC",
          :paging => false
          
end
