module LinkedIn
  # Comments APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/marketing/integrations/community-management/shares/comments-api?view=li-lms-2022-07
  class Comments < APIResource

    def comments(options = {})
      path = comments_path(options)
      get(path, options)
    end

    def comment(options = {})
      path = comment_path(options)
      get(path, options)
    end

    private ##############################################################

    def comments_path(options)
      entity_urn = options.delete(:entity_urn)
      path = "/socialActions/#{CGI.escape(entity_urn)}/comments?"

      paginate(path, options)
    end

    def comment_path(options)
      entity_urn = options.delete(:entity_urn)
      id = options.delete(:id)
      path = "/socialActions/#{CGI.escape(entity_urn)}/comments/#{CGI.escape(id)}"
    end
  end
end