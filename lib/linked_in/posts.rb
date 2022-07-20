module LinkedIn
  # Posts APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/marketing/integrations/community-management/shares/posts-api?view=li-lms-2022-07
  class Posts < APIResource

    def organization_posts(options = {})
      path = organization_posts_path(options)
      get(path, options)
    end

    def posts(options = {})
      path = posts_path(options)
      get(path, options)
    end

    def post(options = {})
      path = post_path(options)
      get(path, options)
    end

    private ##############################################################

    def organization_posts_path(options)
      organization_id = options.delete(:organization_id)
      path = "/posts?author=#{CGI.escape(id_to_urn(organization_id, :organization))}&isDsc=false&q=author"

      paginate(path, options)
    end

    def posts_path(options)
      urn = options.delete(:urn)
      path = "/posts?ids="

      build_url_with_urn_list(path, urn)
    end

    def post_path(options)
      urn = options.delete(:urn)
      path = "/posts/#{CGI.escape(urn)}"
    end
  end
end