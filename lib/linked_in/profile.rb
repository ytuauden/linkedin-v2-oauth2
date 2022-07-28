module LinkedIn
  # Profile APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/shared/integrations/people/profile-api?view=li-lms-2022-07
  class Profile < APIResource

    def current_user(options = {})
      path = profile_path(options)
      get(path)
    end

    private ##############################################################

    def profile_path(options)
      path = '/me'
      fields = options.delete(:fields)
      path + '?projection=(' + format_fields_list(fields) + ')' unless fields.blank?
    end
  end
end
