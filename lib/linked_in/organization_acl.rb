module LinkedIn
  # Organization ACL APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/compliance/integrations/organizations/organization-access-control
  class OrganizationAcl < APIResource

    def organization_acl(options = {})
      path = organization_acl_path(options)
      get(path, options)
    end

    private ##############################################################

    def organization_acl_path(options)
      "/organizationAcls"
    end
  end
end
