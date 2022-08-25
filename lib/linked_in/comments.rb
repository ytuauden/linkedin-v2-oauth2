module LinkedIn
  # Comments APIs
  #
  # @see https://docs.microsoft.com/en-us/linkedin/marketing/integrations/community-management/shares/comments-api?view=li-lms-2022-07
  class Comments < APIResource

    def create_comment_on_post(comment, options)
      path = comments_on_post_path(options)
      post(path, comment, options.delete(:headers))
    end

    def create_comment_on_comment(comment, options)
      path = comments_on_comment_path(options)
      headers = options.delete(:headers)
      headers['Connection'] = 'keep-alive'
      headers['Content-Type'] = 'application/json'
      post(path, comment, headers)
    end

    def comments_on_post(options = {})
      path = comments_on_post_path(options)
      options['fields'] = options.delete(:fields).join(',') if options[:fields].present?
      options = set_restli_protocol_version_header(options)
      get(path, options)
    end

    def comments_on_comment(options = {})
      path = comments_on_comment_path(options)
      options['fields'] = options.delete(:fields).join(',') if options[:fields].present?
      get(path, options)
    end

    def comment(options = {})
      path = comment_path(options)
      get(path, options)
    end

    def edit_comment(request, options = {})
      path = edit_comment_path(options)
      post_with_params(path, request, { actor: options.delete(:organization_urn) }, { 'Content-Type' => 'application/json' })
    end

    def delete_comment(options = {})
      path = delete_comment_path(options)
      delete(path, options)
    end

    private ##############################################################

    def comments_on_post_path(options)
      "/socialActions/#{CGI.escape(options.delete(:entity_urn))}/comments"
    end

    def comments_on_comment_path(options)
      "/socialActions/#{options.delete(:comment_urn)}/comments"
    end

    def comment_path(options)
      "/socialActions/#{CGI.escape(options.delete(:entity_urn))}/comments/#{CGI.escape(options.delete(:id))}"
    end

    def edit_comment_path(options)
      "/socialActions/#{options.delete(:entity_urn)}/comments/#{options.delete(:id)}"
    end

    def delete_comment_path(options)
      edit_comment_path(options)
    end
  end
end
