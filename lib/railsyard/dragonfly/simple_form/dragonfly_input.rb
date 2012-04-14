module Railsyard
  module Dragonfly
    module Inputs

      class DragonflyInput < SimpleForm::Inputs::FileInput
        def input

          components = options[:components] || [ :file_field ]

          out = ''

          components.each do |component|
            if component == :file_field
              out << @builder.file_field(attribute_name, input_html_options)
              out << @builder.hidden_field("retained_#{attribute_name}")
            elsif component == :url
              out << @builder.label("#{attribute_name}_url")
              out << @builder.text_field("#{attribute_name}_url")
            elsif component == :remove
              out << @builder.label("remove_#{attribute_name}")
              out << @builder.check_box("remove_#{attribute_name}")
            end
          end

          out.html_safe
        end
      end

    end
  end
end

