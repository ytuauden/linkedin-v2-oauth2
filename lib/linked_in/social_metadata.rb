module LinkedIn
  # Social Metadata APIs
  #
  # @see https://docs.microsoft.com/fr-fr/linkedin/marketing/integrations/community-management/shares/social-metadata-api?view=li-lms-2022-07
  class SocialMetadata < APIResource

    def social_metadata(options = {})
      path = "#{social_metadata_path}/#{CGI.escape(options.delete(:entity_urn))}"
      options = set_restli_protocol_version_header(options)
      get(path, options)
    end

    def batch_social_metadata(options = {})
      path = social_metadata_path
      options['ids'] = "List(#{CGI.escape(options.delete(:entity_urn).join(','))})"
      options = set_restli_protocol_version_header(options)
      get(path, options)
    end

    private ##############################################################

    def social_metadata_path
      '/socialMetadata'
    end
  end
end
