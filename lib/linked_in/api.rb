module LinkedIn
  class API

    attr_accessor :access_token

    def initialize(access_token=nil)
      access_token = parse_access_token(access_token)
      verify_access_token!(access_token)
      @access_token = access_token

      @connection = LinkedIn::Connection.new params: default_params,
                                             headers: default_headers

      initialize_endpoints
    end

    extend Forwardable # Composition over inheritance
    def_delegators :@comments, :create_comment_on_post,
                               :create_comment_on_comment,
                               :comments_on_post,
                               :comments_on_comment,
                               :comment,
                               :edit_comment,
                               :delete_comment

    def_delegators :@images, :images

    def_delegators :@organization, :organization,
                                   :organizations_lookup

    def_delegators :@organization_acl, :organization_acl

    def_delegators :@posts, :posts_by_organization,
                            :post,
                            :single_post

    def_delegators :@profile, :current_user,
                              :people

    def_delegators :@reactions, :create_reaction,
                                :delete_reaction

    def_delegators :@social_metadata, :social_metadata,
                                      :batch_social_metadata

    def_delegators :@vector_assets, :register_upload,
                                    :upload_image

    def_delegators :@videos, :videos

    private ##############################################################

    def initialize_endpoints
      @comments = LinkedIn::Comments.new(@connection)
      @images = LinkedIn::Images.new(@connection)
      @organization = LinkedIn::Organization.new(@connection)
      @organization_acl = LinkedIn::OrganizationAcl.new(@connection)
      @posts = LinkedIn::Posts.new(@connection)
      @profile = LinkedIn::Profile.new(@connection)
      @reactions = LinkedIn::Reactions.new(@connection)
      @social_metadata = LinkedIn::SocialMetadata.new(@connection)
      @vector_assets = LinkedIn::VectorAssets.new(@connection)
      @videos = LinkedIn::Videos.new(@connection)
    end

    def default_params
      {}
    end

    def default_headers
      # https://docs.microsoft.com/fr-fr/linkedin/shared/authentication/client-credentials-flow?context=linkedin%2Fcontext&view=li-lms-2022-07#step-3-make-api-requests
      {
        'Connection' => 'Keep-Alive',
        'LinkedIn-Version' => LinkedIn.config.api_version,
        'Authorization' => "Bearer #{@access_token.token}"
      }
    end

    def verify_access_token!(access_token)
      if not access_token.is_a? LinkedIn::AccessToken
        raise no_access_token_error
      end
    end

    def parse_access_token(access_token)
      if access_token.is_a? LinkedIn::AccessToken
        return access_token
      elsif access_token.is_a? String
        return LinkedIn::AccessToken.new(access_token)
      end
    end

    def no_access_token_error
      msg = LinkedIn::ErrorMessages.no_access_token
      LinkedIn::InvalidRequest.new(msg)
    end
  end
end
