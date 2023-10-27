module LinkedIn
  # Organization APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/marketing/integrations/community-management/organizations/organization-lookup-api?view=li-lms-2022-07
  class Organization < APIResource

    def organization(options = {})
      path = organization_path(options)
      get(path, options)
    end

    def organizations_lookup(options = {})
      path = organizations_lookup_path
      options = set_restli_protocol_version_header(options)
      get(path, options)
    end

    private ##############################################################

    def organization_path(options)
      "/organizations/#{options.delete(:organization_id)}"
    end

    def organizations_lookup_path
      '/organizationsLookup'
    end
  end
end
