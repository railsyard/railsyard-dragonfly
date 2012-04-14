$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "railsyard/dragonfly/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "railsyard-dragonfly"
  s.version     = Railsyard::Dragonfly::VERSION
  s.authors     = ["Stefano Verna"]
  s.email       = ["stefano.verna@gmail.com"]
  s.homepage    = "http://github.com/cantierecreativo/railsyard-dragonfly"
  s.summary     = "Adds a new :dragonfly field type to your Railsyard installation"
  s.description = "Adds a new :dragonfly field type to your Railsyard installation"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "railsyard"
  s.add_dependency "rails", "~> 3.2.1"
  s.add_dependency "simple_form", "~> 2.0.1"
end
