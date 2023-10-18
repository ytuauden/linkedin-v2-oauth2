module LinkedIn
  # Images APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/marketing/integrations/community-management/shares/images-api?view=li-lms-2022-07
  class Images < APIResource

    def image(options = {})
      path = "#{images_path(options)}/#{CGI.escape(options.delete(:image_urn))}"
      options = set_restli_protocol_version_header(options)
      get(path, options)
    end

    def images(options = {})
      path = images_path(options)
      options['ids'] = "List(#{options.delete(:images_urn).map { |urn| CGI.escape(urn) }.join(',')})"
      options = set_restli_protocol_version_header(options)
      get(path, options)
    end

    def upload_image(organisation_urn, image_path, options = {})
      path = upload_image_path(options)
      res = post(path, { initializeUploadRequest: { owner: organisation_urn } }.to_json, options)
      upload_url = res.dig('value', 'uploadUrl')
      image_urn = res.dig('value', 'image')

      upload_asset(upload_url, image_path, 'image')

      image_urn
    end

    private ##############################################################

    def images_path(options)
      '/images'
    end

    def upload_image_path(options)
      "/images?action=initializeUpload"
    end
  end
end
