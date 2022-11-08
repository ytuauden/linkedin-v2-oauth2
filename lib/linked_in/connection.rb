module LinkedIn
  class DoNotEscapeEncoder
    def self.encode(params)
      buffer = ''
      params.each do |key, value|
        buffer << "#{key}=#{value}&"
      end
      buffer.chop
    end
  end

  # Used to perform requests against LinkedIn's API.
  class Connection < ::Faraday::Connection

    def initialize(url=nil, options=nil, &block)

      if url.is_a? Hash
        options = url
        url = options[:url]
      end

      url = default_url if url.nil?

      super url, options, &block

      # We need to use the FlatParamsEncoder so we can pass multiple of
      # the same param to certain endpoints (like the search API).
      self.options.params_encoder = LinkedIn::DoNotEscapeEncoder

      self.response :logger, LinkedIn.logger, { headers: false, bodies: false }

      self.response :linkedin_raise_error
    end


    private ##############################################################


    def default_url
      LinkedIn.config.api + LinkedIn.config.api_version
    end
  end
end
