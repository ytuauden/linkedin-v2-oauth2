module LinkedIn
  # Organization APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/marketing/integrations/community-management/organizations/organization-lookup-api?view=li-lms-2022-07
  class Organization < APIResource

    def organization(options = {})
      path = organization_path(options)
      get(path, options)
    end

    private ##############################################################

    def organization_path(options)
      "/organizations/#{options.delete(:organization_id)}"
    end
  end
end
