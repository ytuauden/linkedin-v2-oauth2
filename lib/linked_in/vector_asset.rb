module LinkedIn
  # Vector Assets APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/marketing/integrations/community-management/shares/vector-asset-api?view=li-lms-2022-07
  class VectorAssets < APIResource

    def register_upload(options = {})
      path = register_upload_path(options)
      post(path)
    end

    private ##############################################################

    def register_upload_path(_options)
      '/assets?action=registerUpload'
    end
  end
end
