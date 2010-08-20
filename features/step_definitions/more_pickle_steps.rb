# additional steps to what pickle offers. Please add your steps here as
#   pickle_steps.rb
# might be overwritten in a pickle upgrade

# set an attribute to another model

Given(/^#{capture_model}(?:'s)? (\w+) is #{capture_model}$/) do |name, association, ref|
  model!(name).update_attribute association, model!(ref)
end

Given(/^#{capture_model}(?:'s)? (\w+) is "([^"])"$/) do |name, attribute, value|
  model!(name).update_attribute attribute, value
end

Given(/^#{capture_model}(?:'s)? (\w+) include #{capture_model}$/) do |name, association, ref|
  model!(name).send(association) << model!(ref)
end
