require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  def test_should_create_factory_product
    assert_nothing_raised do
      Factory.create :product
    end
  end

  def test_should_not_create_product_with_dup_title
    Factory.create :product, :title => "not unique i guess"
    assert_raise ActiveRecord::RecordInvalid do
      Factory.create :product, :title => "not unique i guess"
    end
  end

  def test_should_not_create_product_without_required_attributes
    attribs = [:title, :description, :shop, :image]
    attribs.each do |attrib|
      assert_raise ActiveRecord::RecordInvalid do
        Factory.create :product, attrib => nil
      end
    end
  end

  def test_listing_scopes
    first = Factory.create :product
    shop = first.shop
    second = Factory.create :product, :shop => shop
    third = Factory.create :product, :shop => shop
    other = Factory.create :product

    assert_equal [first, second, third], shop.products
    assert_equal [first, second, third], Product.limit(3)
    assert_not_equal [first, second, third], Product.randomize.limit(3)
    assert_equal 3, shop.products.randomize.count
    assert_equal 4, Product.randomize.count
    assert_equal 3, Product.without(first).count
    assert_equal 2, Product.limit(2).all.count
    assert_equal 3, Product.limit(3).without(first).all.count
  end

  def test_similarity_scopes
    peach = Factory.create :product, :tag_list => "fruit, orange, tasty"
    orange = Factory.create :product, :tag_list => "fruit, orange, tasty"
    apple = Factory.create :product, :tag_list => "fruit, green, tasty"
    spaghetti = Factory.create :product, :tag_list => "food, noodles, tasty"
    bike = Factory.create :product, :tag_list => "object, traffic, fun"
    assert_equal [orange, apple, spaghetti], Product.similar_to(peach).without(peach)
    assert_equal [3, 3, 2, 1], Product.similar_to(peach).map(&:similarity)
  end
end
