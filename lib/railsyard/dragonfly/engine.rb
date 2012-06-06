module Railsyard
  module Dragonfly
    class Engine < ::Rails::Engine

      initializer "Railsyard precompile hook", :group => :assets do |app|
        app.config.assets.precompile += [
          "railsyard/admin/railsyard_dragonfly.css",
          "railsyard/admin/railsyard_dragonfly.js"
        ]
      end

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
