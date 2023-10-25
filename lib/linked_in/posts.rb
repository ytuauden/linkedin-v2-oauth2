module LinkedIn
  # Posts APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/marketing/integrations/community-management/shares/posts-api?view=li-lms-2022-07
  class Posts < APIResource

    def posts(options = {})
      path = posts_path
      options['author'] = CGI.escape(options.delete(:author_urn))
      get(path, options)
    end

    def post(options = {})
      path = post_path(options)
      get(path, options)
    end

    private ##############################################################

    def posts_path
      '/posts'
    end

    def post_path(options)
      "/posts/#{CGI.escape(options.delete(:urn))}"
    end
  end
end
