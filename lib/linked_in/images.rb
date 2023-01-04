module LinkedIn
  # Images APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/marketing/integrations/community-management/shares/images-api?view=li-lms-2022-07
  class Images < APIResource

    def images(options = {})
      path = images_path(options)
      options['ids'] = "List(#{options.delete(:images_urn).map { |urn| CGI.escape(urn) }.join(',')})"
      options = set_restli_protocol_version_header(options)
      get(path, options)
    end

    private ##############################################################

    def images_path(options)
      '/images'
    end
  end
end
