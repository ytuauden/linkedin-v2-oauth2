module LinkedIn
  # Reactions APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/marketing/integrations/community-management/shares/reactions-api?view=li-lms-2022-08
  class Reactions < APIResource

    def create_reaction_on_comment(reaction, options = {})
      path = create_reaction_path
      post_with_params(path, reaction, { actor: options.delete(:organization_urn) }, { 'Content-Type' => 'application/json' } )
    end

    private ##############################################################

    def create_reaction_path
      '/reactions'
    end
  end
end
