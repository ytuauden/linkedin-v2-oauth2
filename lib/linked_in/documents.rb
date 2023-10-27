module LinkedIn
  # Documents APIs
  #
  # @see https://learn.microsoft.com/en-us/linkedin/marketing/integrations/community-management/shares/documents-api?view=li-lms-2023-09&tabs=http
  class Documents < APIResource

    def document(options = {})
      path = "#{documents_path}/#{CGI.escape(options.delete(:document_urn))}"
      options = set_restli_protocol_version_header(options)
      get(path, options)
    end

    private ##############################################################

    def documents_path
      '/documents'
    end
  end
end
