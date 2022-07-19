module LinkedIn
  # Profile APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/shared/integrations/people/profile-api?view=li-lms-2022-07
  class Profile < APIResource

    def current_user
      path = profile_path
      get(path)
    end

    private ##############################################################

    def profile_path
      "/me?projection=(id,localizedFirstName,localizedLastName,profilePicture(displayImage~:playableStreams))"
    end
  end
end