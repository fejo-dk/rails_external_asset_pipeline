module RailsExternalAssetPipeline
  module ComputeAssetPath
    def compute_asset_path(source, options = {})
      if options[:type] == :image
        manifest = JSON.parse(File.read("#{Rails.root}/public/assets/manifests/image.json"))
        manifest.fetch(source)
      else
        source
      end
    end
  end
end
