module RailsExternalAssetPipeline
  class Manifest
    def initialize(type)
      @type = type
    end

    def fetch(asset_name)
      parsed_manifest.fetch(asset_name)
    rescue KeyError
      raise "The asset '#{asset_name}' of type '#{@type}' was not in the manifest"
    end

    private

    def parsed_manifest
      JSON.parse(unparsed_manifest)
    rescue JSON::ParserError
      raise "The manifest file '#{asset_path}' is invalid JSON"
    end

    def unparsed_manifest
      File.read(full_asset_path)
    rescue Errno::ENOENT
      raise "The manifest file '#{asset_path}' is missing"
    end

    def full_asset_path
      File.join(Rails.root, asset_path)
    end

    def asset_path
      File.join("public", "assets", "manifests", "#{@type}.json")
    end
  end
end
