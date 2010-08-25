Given /^#{capture_model} is tagged as "([^"]*)"$/ do |product, tag_list|
  product = model!(product)
  product.tag_list = tag_list
  product.save!
end

Given /^#{capture_model} has an image$/ do |product|
  product = model!(product)
  image = Factory.make :image
  product.image = image
  product.save!
end

Then /^#{capture_model} should be tagged with "([^"]*)"$/ do |product, tag|
  model!(product).tags.map(&:name).should include(tag)
end
