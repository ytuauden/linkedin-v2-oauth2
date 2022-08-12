module LinkedIn
  # Videos APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/marketing/integrations/community-management/shares/videos-api?view=li-lms-2022-07
  class Videos < APIResource

    def videos(options = {})
      path = videos_path(options)
      set_restli_protocol_version_header(options)
      get(path, options)
    end

    private ##############################################################

    def videos_path(options)
      urn = options.delete(:urn)
      path = '/videos'
      if urn.is_a?(Array)
        path += '?ids='

        build_url_with_urn_list(path, urn)
      else
        path += "/#{CGI.escape(urn)}"
      end
    end
  end
end
