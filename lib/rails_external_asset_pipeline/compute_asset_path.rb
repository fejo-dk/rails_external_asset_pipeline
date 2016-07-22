module RailsExternalAssetPipeline
  module ComputeAssetPath
    TYPES_WITH_MANIFEST = %i(stylesheet image)

    def compute_asset_path(source, options = {})
      if TYPES_WITH_MANIFEST.include? options[:type]
        manifest = JSON.parse(File.read("#{Rails.root}/public/assets/manifests/#{options[:type]}.json"))
        manifest.fetch(source)
      else
        source
      end
    end
  end
end
