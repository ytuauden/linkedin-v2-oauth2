module LinkedIn
  # Images APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/marketing/integrations/community-management/shares/images-api?view=li-lms-2022-07
  class Images < APIResource

    def images(options = {})
      path = images_path(options)
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
      "/images/#{CGI.escape(options.delete(:urn))}"
    end

    def upload_image_path(options)
      "/images?action=initializeUpload"
    end
  end
end
