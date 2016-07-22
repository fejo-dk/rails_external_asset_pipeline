require "rails_external_asset_pipeline/not_in_manifest_error"
require "rails_external_asset_pipeline/missing_manifest_error"
require "rails_external_asset_pipeline/invalid_manifest_error"

module RailsExternalAssetPipeline
  module ComputeAssetPath
    TYPES_WITH_MANIFEST = %i(stylesheet image javascript)

    def compute_asset_path(source, options = {})
      if TYPES_WITH_MANIFEST.include? options[:type]
        manifest = load_manifest_for(options[:type])
        manifest.fetch(source)
      else
        source
      end
    rescue KeyError
      raise NotInManifestError, "The asset '#{source}' of type '#{options[:type]}' was not in the manifest"
    end

    private

    def load_manifest_for(type)
      JSON.parse(foo(type))
    rescue JSON::ParserError
      raise InvalidManifestError, "The manifest file 'public/assets/manifests/#{type}.json' is invalid JSON"
    end

    def foo(type)
      File.read("#{Rails.root}/public/assets/manifests/#{type}.json")
    rescue Errno::ENOENT
      raise MissingManifestError, "The manifest file 'public/assets/manifests/#{type}.json' is missing"
    end
  end
end

