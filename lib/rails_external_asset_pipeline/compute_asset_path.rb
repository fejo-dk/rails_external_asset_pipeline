require "rails_external_asset_pipeline/not_in_manifest_error"
require "rails_external_asset_pipeline/missing_manifest_error"

module RailsExternalAssetPipeline
  module ComputeAssetPath
    TYPES_WITH_MANIFEST = %i(stylesheet image javascript)

    def compute_asset_path(source, options = {})
      if TYPES_WITH_MANIFEST.include? options[:type]
        manifest = JSON.parse(File.read("#{Rails.root}/public/assets/manifests/#{options[:type]}.json"))
        manifest.fetch(source)
      else
        source
      end
    rescue KeyError
      raise NotInManifestError, "The asset '#{source}' of type '#{options[:type]}' was not in the manifest"
    end
  end
end

