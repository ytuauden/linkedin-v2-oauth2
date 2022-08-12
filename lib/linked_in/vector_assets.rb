module LinkedIn
  # Vector Assets APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/marketing/integrations/community-management/shares/vector-asset-api?view=li-lms-2022-07
  class VectorAssets < APIResource

    def register_upload(request, options = {})
      path = register_upload_path(options)
      options = set_restli_protocol_version_header(options)
      headers = options.delete(:headers)
      headers['Connection'] = 'keep-alive'
      headers['Content-Type'] = 'application/json'
      post(path, request, options.delete(:headers))
    end

    def upload_image(options)
      path = options.delete(:upload_url)
      put(path, Faraday::UploadIO.new(options.delete(:image_path), options.delete(:content_type)))
    end

    private ##############################################################

    def register_upload_path(_options)
      '/assets?action=registerUpload'
    end
  end
end
