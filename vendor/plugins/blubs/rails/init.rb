Refinery::Plugin.register do |plugin|
  plugin.name = "blubs"
  plugin.activity = {
    :class => Blub,
    :title => 'name'
  }

  plugin.directory = directory # tell refinery where this plugin is located
end
