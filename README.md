# Railsyard::Dragonfly

Add a Dragonfly attachment to your backend resource.


## Installation

1. Gemfile:

        gem "railsyard-dragonfly"

2. Configure Dragonfly initializer and migration (see https://github.com/markevans/dragonfly)

3. Backend configuration (e.g. app/backend/editor_for_books.rb):

        field :image, as: :dragonfly do
          input_options components: [ :preview, :upload, :url, :remove ] # use any of these
        end
