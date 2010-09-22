module OwnerLimited


  def self.append_features(base)
    super
    base.extend(ClassMethods)
  end


  module ClassMethods

    def limit_to_user(model_name, new_options = {})
      singular_name = model_name.to_s
      plural_name = singular_name.pluralize

      module_eval %(

        def find_#{singular_name}_with_user
          find_#{singular_name}_without_user
          @#{singular_name} = @#{singular_name}.where(:user_id => current_user.id)
        end

        alias_method_chain :find_#{singular_name}, :user

        def find_all_#{plural_name}_with_user
          find_all_#{plural_name}_without_user
          @#{plural_name} = @#{plural_name}.where(:user_id => current_user.id)
        end

        alias_method_chain :find_all_#{plural_name}, :user

      )
    end

    def limit_to_shop(model_name, new_options = {})
      singular_name = model_name.to_s
      plural_name = singular_name.pluralize

      module_eval %(
        
        before_filter :get_shop_for_product,
          :only => [:update, :destroy, :edit, :show]
            
        def get_shop_for_product
          @shop = current_user.shops.find(@#{singular_name}.shop_id)
          @#{singular_name} = nil unless @shop
        end

        def find_all_#{plural_name}_with_shop
          @shop = current_user.shops.find(params[:shop_id]) rescue current_user.shops.first
          return unless @shop
          find_all_#{plural_name}_without_shop
          @#{plural_name} = @#{plural_name}.where(:shop_id => @shop.id)
        end

        alias_method_chain :find_all_#{plural_name}, :shop

      )
    end
  end

end
