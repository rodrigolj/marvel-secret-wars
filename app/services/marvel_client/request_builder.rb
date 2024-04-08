module MarvelClient
  class RequestBuilder
    def initialize
      @path = []
    end

    def add_resource(resource, resource_id = nil)
      raise ArgumentError, "Invalid resource name" unless VALID_RESOURCES.include?(resource)

      @path << resource.to_s
      @path << resource_id.to_s if resource_id
      self
    end

    def build
      @path.join("/")
    end

    def clear
      @path = []
      self
    end
  end
end
