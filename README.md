# Railsyard::Dragonfly

Add a Dragonfly attachment to your backend resource.


## Installation

1. Gemfile:

        gem "railsyard-dragonfly"

## Usage

1. Configure Dragonfly initializer and migration (see https://github.com/markevans/dragonfly)

2. Backend configuration (e.g. app/backend/editor_for_books.rb):

        field :image, as: :dragonfly do
          input_options components: [ :preview, :upload, :url, :remove ] # use any of these
        end

... or just use the generator:

    rails g railsyard:editor Book title:string image:dragonfly
