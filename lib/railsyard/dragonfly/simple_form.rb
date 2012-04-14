require 'railsyard/dragonfly/simple_form/dragonfly_input'

module Railsyard
  module Dragonfly
    module Inputs
    end
  end
end

SimpleForm::Inputs.send(:include, Railsyard::Dragonfly::Inputs)
