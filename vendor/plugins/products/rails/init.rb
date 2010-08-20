Refinery::Plugin.register do |plugin|
  plugin.name = "products"
  plugin.activity = {
    :class => Product}

  plugin.directory = directory # tell refinery where this plugin is located
end
