module Railsyard
  module Dragonfly
    module Inputs

      class DragonflyInput < SimpleForm::Inputs::FileInput

        def input
          components = options[:components] || [ :preview, :upload ]

          out = '<div class="dragonfly-fields">'

          components.each do |component|
            out << "<div class='dragonfly-field field-#{component}'>"
            if component == :upload
              out << @builder.label(I18n.t("railsyard.dragonfly.upload"))
              out << @builder.file_field(attribute_name, input_html_options)
              out << @builder.hidden_field("retained_#{attribute_name}")
            elsif component == :preview
              preview_size = options[:preview_size] || "72x72#"
              if object.send("#{attribute_name}_uid")
                original_url = object.send(attribute_name).url
                preview_url = object.send(attribute_name).thumb(preview_size).url
                out << template.link_to(template.image_tag(preview_url), original_url)
              else
                out << "<div class='no-image'>#{I18n.t("railsyard.dragonfly.no_image")}</div>"
              end
            elsif component == :url
              out << @builder.label(I18n.t("railsyard.dragonfly.url"))
              out << @builder.text_field("#{attribute_name}_url")
            elsif component == :remove
              out << @builder.check_box("remove_#{attribute_name}")
              out << @builder.label(I18n.t("railsyard.dragonfly.remove"))
            end
            out << "</div>"
          end

          out << "</div>"

          out.html_safe
        end
      end

    end
  end
end

