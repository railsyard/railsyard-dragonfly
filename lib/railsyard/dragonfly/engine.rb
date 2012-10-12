module Railsyard
  module Dragonfly
    class Engine < ::Rails::Engine

      initializer "Railsyard precompile hook", :group => :all do |app|
        app.config.assets.precompile += [
          "railsyard/admin/railsyard_dragonfly.css",
          "railsyard/admin/railsyard_dragonfly.js"
        ]
        require 'dragonfly/rails/images'
      end

      config.to_prepare do
        editor_config = <<DSL
field :%{name}, as: :dragonfly do
      input_options components: [ :preview, :upload, :url, :remove ] # any of these
    end
DSL
        model_config = <<MODEL
  image_accessor :%{name}
MODEL
        Railsyard::Backend.plugin_manager.add_plugin(:dragonfly) do
          name "Dragonfly"
          backend_javascript_dependency "railsyard/admin/railsyard_dragonfly"
          backend_stylesheet_dependency "railsyard/admin/railsyard_dragonfly"
          generator_editor_type(:dragonfly,
                                {"%{name}_uid" => :string, "%{name}_name" => :string},
                                editor_config,
                                model_config)
        end
      end
    end
  end
end
