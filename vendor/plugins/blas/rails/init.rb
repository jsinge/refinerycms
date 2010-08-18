Refinery::Plugin.register do |plugin|
  plugin.name = "blas"
  plugin.activity = {
    :class => Bla,
    :title => 'test'
  }

  plugin.directory = directory # tell refinery where this plugin is located
end
