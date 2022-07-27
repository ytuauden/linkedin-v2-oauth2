module LinkedIn
  # Posts APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/marketing/integrations/community-management/shares/posts-api?view=li-lms-2022-07
  class Posts < APIResource

    def posts_by_organization(options = {})
      path = posts_by_organization_path
      options['q'] = 'authors'
      options['authors'] = "List(#{CGI.escape(options.delete(:organization_urn))})"
      options['fields'] = options.delete(:fields).join(',')
      options['sortBy'] = options.delete(:sort_by)
      options['start'] = options.delete(:start)
      options['count'] = options.delete(:count)
      get(path, options)
    end

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

    def posts_by_organization_path
      '/ugcPosts'
    end

    def organization_posts_path(options)
      organization_urn = options.delete(:organization_urn)
      fields = options.delete(:fields)
      path = "/posts?author=#{CGI.escape(organization_urn)}&isDsc=false&q=author"
      path = path + '&fields=' + format_fields_list(fields) unless fields.blank?

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