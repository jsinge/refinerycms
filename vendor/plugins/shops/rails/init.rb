Refinery::Plugin.register do |plugin|
  plugin.name = "shops"
  plugin.activity = {
    :class => Shop}

  plugin.directory = directory # tell refinery where this plugin is located
end
