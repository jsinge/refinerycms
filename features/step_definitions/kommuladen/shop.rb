# Create a shop with a user
Given /^"([^"]*)" runs a shop "([^"]*)"$/ do |owner, shop|
  Given "a user: \"#{login}\" exists with login: \"#{login}\", name: \"#{owner}\""
  Given "a shop: \"#{shop.underscore}\" exists with title: \"#{shop}\", user: that user"
end

Given /^#{capture_model} sells "([^"]*)"(?: for (\d*))?$/ do |shop, product, price|
  Given "a product: \"#{product.underscore}\" exists with title: \"#{product}\", price: \"#{price}\", shop: #{shop}"
end

