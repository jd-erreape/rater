$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rater/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rater"
  s.version     = Rater::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Rater."
  s.description = "TODO: Description of Rater."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"
  s.add_development_dependency "shoulda-matchers"
end
