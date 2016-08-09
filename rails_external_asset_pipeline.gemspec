$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_external_asset_pipeline/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name = "rails_external_asset_pipeline"
  spec.version = RailsExternalAssetPipeline::VERSION
  spec.authors = ["Lucas Dohmen"]
  spec.email = ["lucas.dohmen@innoq.com"]

  spec.summary = %q(Use Rails with an external asset pipeline)
  spec.description = %q(Instead of using the build-inn asset pipeline of Rails, some people want to use external asset pipelines – written in Node.js for example. This gem enables the required integration with Rails.)
  spec.homepage = "https://github.com/fejo-dk/rails_external_asset_pipeline"
  spec.license = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 4.2.6"

  spec.add_development_dependency "rubocop", "~> 0.41.2"
  spec.add_development_dependency "rake", "~> 11.2.2"
end
