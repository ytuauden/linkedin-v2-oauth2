module LinkedIn
  # Organization APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/marketing/integrations/community-management/organizations/organization-lookup-api?view=li-lms-2022-07
  class Organization < APIResource

    def organization(options = {})
      path = organization_path(options)
      get(path, options)
    end

    def organization_profile(options = {})
      path = organization_profile_path(options)
      options['projection'] = "(#{options.delete(:fields).join(',')})" if options[:fields].present?
      options = set_restli_protocol_version_header(options)
      get(path, options)
    end

    private ##############################################################

    def organization_path(options)
      "/organizations/#{options.delete(:organization_id)}"
    end

    def organization_profile_path(options)
      '/organizationsLookup'
    end
  end
end
