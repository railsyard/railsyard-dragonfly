module Railsyard
  module Dragonfly
    class Engine < ::Rails::Engine
      config.to_prepare do
        Railsyard::Backend.plugin_manager.add_plugin(:dragonfly) do
          name "Dragonfly"
          backend_javascript_dependency "railsyard/admin/railsyard_dragonfly"
          backend_stylesheet_dependency "railsyard/admin/railsyard_dragonfly"
        end
      end
    end
  end
end
