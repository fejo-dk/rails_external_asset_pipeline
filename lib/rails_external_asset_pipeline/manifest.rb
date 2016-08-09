module RailsExternalAssetPipeline
  class Manifest
    def initialize(manifests_path, type)
      @manifests_path = manifests_path
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
      raise "The manifest file '#{manifest_path}' is invalid JSON"
    end

    def unparsed_manifest
      File.read(full_manifest_path)
    rescue Errno::ENOENT
      raise "The manifest file '#{manifest_path}' is missing"
    end

    def full_manifest_path
      File.join(Rails.root, manifest_path)
    end

    def manifest_path
      File.join(@manifests_path, "#{@type}.json")
    end
  end
end
