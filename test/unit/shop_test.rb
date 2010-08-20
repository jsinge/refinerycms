require 'test_helper'

class ShopTest < ActiveSupport::TestCase

  def test_should_not_create_shop_without_user
    assert_raise ActiveRecord::RecordInvalid do
      Factory.create :shop, :user => nil
    end
  end

  def test_should_create_factory_shop
    assert_nothing_raised do
      Factory.create :shop
    end
  end

end
