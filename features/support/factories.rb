require 'factory_girl'

Factory.define :user do |u|
  u.sequence(:login) { |n| "person#{n}" }
  u.sequence(:email) { |n| "person#{n}@cucumber.com" }
  u.password  "greenandjuicy"
  u.password_confirmation "greenandjuicy"
end

Factory.define :refinery_user, :parent => :user do |u|
  u.roles { [ Role[:refinery] ] }
  u.after_create do |user|
    Refinery::Plugins.registered.each_with_index do |plugin, index|
      user.plugins.create(:name => plugin.name, :position => index)
    end
  end
end

Factory.define :image do |i|
  i.content_type 'image/jpeg'
  i.filename 'beach.jpeg'
  i.size 5000
end

Factory.define :vendor, :parent => :user do |u|
  u.roles { [ Role[:vendor] ] }
  u.after_create do |user|
    Refinery::Plugins.registered.each_with_index do |plugin, index|
      user.plugins.create(:name => plugin.name, :position => index)
    end
  end
end

Factory.define :shop do |s|
  s.sequence(:title) { |n| "shop #{n}" }
  s.user { |user| user.association(:vendor)}
end

Factory.define :product do |p|
  p.title { Faker::Lorem.words }
  p.description { Faker::Lorem.paragraph }
  p.shop { |shop| shop.association(:shop)}
  p.image { |image| image.association(:image) }
end
