module LinkedIn
  # Posts APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/marketing/integrations/community-management/shares/posts-api?view=li-lms-2022-07
  class Posts < APIResource

    def posts_by_organization(options = {})
      path = posts_by_organization_path
      options['authors'] = "List(#{CGI.escape(options.delete(:organization_urn))})"
      options['fields'] = options.delete(:fields).join(',')
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

    def posts_by_organization_path
      '/ugcPosts'
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
