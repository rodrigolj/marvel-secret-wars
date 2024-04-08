require "net/http"

module MarvelClient
  class Request
    def initialize(resource, resource_id = nil, subresource = nil)
      @public_key = Rails.application.credentials.marvel.public_key
      @private_key = Rails.application.credentials.marvel.private_key
      @timestamp = DateTime.current.to_s
      @builder = MarvelClient::RequestBuilder.new
      @builder.add_resource(resource, resource_id)
      @builder.add_resource(subresource) if subresource
    end

    def run
      request = Net::HTTP.get(generate_uri, headers = { "Accept-Encoding": "gzip" }, use_ssl = true)
      JSON.parse(request)
    end

    private

    def generate_uri
      URI("#{MARVEL_BASE_URL}#{generate_path}?#{generate_query}")
    end

    def generate_path
      "/v1/public/#{@builder.build}"
    end

    def generate_query
      URI.encode_www_form({ apikey: @public_key, ts: @timestamp, hash: generate_hash })
    end

    def generate_hash
      md5 = Digest::MD5.new
      md5.update(@timestamp + @private_key + @public_key)
      md5.hexdigest
    end
  end
end
