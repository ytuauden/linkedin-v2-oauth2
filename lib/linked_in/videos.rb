module LinkedIn
  # Videos APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/marketing/integrations/community-management/shares/videos-api?view=li-lms-2022-07
  class Videos < APIResource

    def videos(options = {})
      path = videos_path(options)
      options = set_restli_protocol_version_header(options)
      get(path, options)
    end

    private ##############################################################

    def videos_path(options)
      "/videos/#{CGI.escape(options.delete(:urn))}"
    end
  end
end
