module LinkedIn
  # Social Metadata APIs
  #
  # @see https://docs.microsoft.com/fr-fr/linkedin/marketing/integrations/community-management/shares/social-metadata-api?view=li-lms-2022-07
  class SocialMetadata < APIResource

    def social_metadata(options = {})
      path = social_metadata_path(options)
      get(path, options)
    end

    private ##############################################################

    def social_metadata_path(options)
      entity_urn = options.delete(:entity_urn)
      path = "/socialMetadata"
      if entity_urn.is_a?(Array)
        path += "?ids="

        build_url_with_urn_list(path, entity_urn)
      else
        path += "/#{CGI.escape(entity_urn)}"
      end
    end
  end
end