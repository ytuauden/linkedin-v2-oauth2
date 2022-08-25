module LinkedIn
  # Images APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/marketing/integrations/community-management/shares/images-api?view=li-lms-2022-07
  class Images < APIResource

    def images(options = {})
      path = images_path(options)
      get(path, options)
    end

    private ##############################################################

    def images_path(options)
      "/images/#{CGI.escape(options.delete(:urn))}"
    end
  end
end
