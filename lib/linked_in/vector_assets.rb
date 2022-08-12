module LinkedIn
  # Vector Assets APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/marketing/integrations/community-management/shares/vector-asset-api?view=li-lms-2022-07
  class VectorAssets < APIResource

    def register_upload(options = {})
      path = register_upload_path
      options = set_restli_protocol_version_header(options)
      headers = options.delete(:headers)
      headers['Connection'] = 'keep-alive'
      headers['Content-Type'] = 'application/json'
      post(path, upload_image_request(options), headers) do |req|
        req.params['action'] = 'registerUpload'
      end
    end

    def upload_image(options = {})
      upload_asset(options.delete(:upload_url), options.delete(:file_path), options.delete(:file_content_type))
    end

    private ##############################################################

    def register_upload_path
      '/assets'
    end

    def upload_image_request(options)
      {
        registerUploadRequest: {
          owner: options.delete(:organization_urn),
          recipes: ["urn:li:digitalmediaRecipe:feedshare-image"],
          serviceRelationships: [
            {
              identifier: "urn:li:userGeneratedContent",
              relationshipType: "OWNER",
            },
          ],
          supportedUploadMechanism: ["SYNCHRONOUS_UPLOAD"],
        },
      }.to_json
    end
  end
end
