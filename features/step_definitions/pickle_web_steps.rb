Then /^(?:|I )should see #{capture_model}(?:'s)? (\w+)(?: within "([^\"]*)")?$/ do |owner, association, selector|
  text = model!(owner.send(association))
  with_scope(selector) do
    if page.respond_to? :should
      page.should have_content(text)
    else
      assert page.has_content?(text)
    end
  end
end

Then /^(?:|I )should not see #{capture_model}(?:'s)? (\w+)(?: within "([^\"]*)")?$/ do |owner, association, selector|
  text = model!(owner.send(association))
  with_scope(selector) do
    if page.respond_to? :should
      page.should have_no_content(text)
    else
      assert page.has_no_content?(text)
    end
  end
end
