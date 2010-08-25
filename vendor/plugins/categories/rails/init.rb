Refinery::Plugin.register do |plugin|
  plugin.name = "categories"
  plugin.activity = {
    :class => Category}

  plugin.directory = directory # tell refinery where this plugin is located
end
