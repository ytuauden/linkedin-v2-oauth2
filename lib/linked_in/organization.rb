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
      path = "/organizations/#{options.delete(:organization_id)}"
      fields = options.delete(:fields)
      path + '?projection=(' + format_fields_list(fields) + ')' unless fields.blank?
    end
  end
end
