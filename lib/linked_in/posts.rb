module LinkedIn
  # Posts APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/marketing/integrations/community-management/shares/posts-api?view=li-lms-2022-07
  class Posts < APIResource

    def posts_by_organization(options = {})
      path = posts_by_organization_path
      options['authors'] = "List(#{CGI.escape(options.delete(:organization_urn))})"
      options['fields'] = options.delete(:fields).join(',') if options[:fields].present?
      options = set_restli_protocol_version_header(options)
      get(path, options)
    end

    def create_post(options = {})
      path = create_post_path(options)
      options['projection'] = "(#{options.delete(:fields).join(',')})" if options[:fields].present?
      options = set_restli_protocol_version_header(options)
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

    def create_post_path(options)
      "/ugcPosts/#{CGI.escape(options.delete(:urn))}"
    end

    def post_path(options)
      "/posts/#{CGI.escape(options.delete(:post_urn))}"
    end
  end
end
