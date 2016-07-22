require "rails_external_asset_pipeline/compute_asset_path"

module RailsExternalAssetPipeline
  class Railtie < Rails::Railtie
    ActiveSupport.on_load(:action_view) do
      include RailsExternalAssetPipeline::ComputeAssetPath
    end
  end
end
