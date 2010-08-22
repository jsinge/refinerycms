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

end
