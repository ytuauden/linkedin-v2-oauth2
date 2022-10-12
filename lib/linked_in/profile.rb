module LinkedIn
  # Profile APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/shared/integrations/people/profile-api?view=li-lms-2022-07
  class Profile < APIResource

    def current_user(options = {})
      path = profile_path(options)
      options['projection'] = "(#{options.delete(:fields).join(',')})" if options[:fields].present?
      get(path)
    end

    def people(options = {})
      path = people_path
      options['projection'] = "(#{options.delete(:fields).join(',')})" if options[:fields].present?
      options = set_restli_protocol_version_header(options)
      get(path, options)
    end

    private ##############################################################

    def profile_path(options)
      '/me'
    end

    def people_path
      '/people'
    end
  end
end
