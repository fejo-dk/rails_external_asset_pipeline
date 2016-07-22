require 'rails_external_asset_pipeline/manifest'

module RailsExternalAssetPipeline
  module ComputeAssetPath
    TYPES_WITH_MANIFEST = %i(stylesheet image javascript)

    def compute_asset_path(source, options = {})
      if TYPES_WITH_MANIFEST.include? options[:type]
        manifest = Manifest.new(options[:type])
        manifest.fetch(source)
      else
        source
      end
    end
  end
end
