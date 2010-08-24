# Create a shop with a user
Given /^"([^"]*)" runs a shop "([^"]*)"$/ do |owner, shop|
  login = owner.underscore
  owner = create_model "user: \"#{login}\"", :login => login, :name => owner
  create_model "a shop: \"#{shop.underscore}\"", :title =>shop, :user => owner
end

Given /^#{capture_model} sells "([^"]*)"(?: for (\d*\.\d*))?$/ do |shop, product, price|
  shop = model!(shop)
  create_model "a product: \"#{product.underscore}\"", :title => product, :price => price, :shop => shop
end

