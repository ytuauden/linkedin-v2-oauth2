require "oauth2"

require "linked_in/errors"
require "linked_in/raise_error"
require "linked_in/version"
require "linked_in/configuration"

# Responsible for all authentication
# LinkedIn::OAuth2 inherits from OAuth2::Client
require "linked_in/oauth2"

# Coerces LinkedIn JSON to a nice Ruby hash
# LinkedIn::Mash inherits from Hashie::Mash
require "hashie"
require "linked_in/mash"

# Wraps a LinkedIn-specifc API connection
# LinkedIn::Connection inherits from Faraday::Connection
require "faraday"

module Faraday
  module FlatParamsEncoder
    def self.escape(arg)
      arg
    end
  end
end

require "linked_in/connection"

# Data object to wrap API access token
require "linked_in/access_token"

# Endpoints inherit from APIResource
require "linked_in/api_resource"

# All of the endpoints
require "linked_in/comments"
require "linked_in/images"
require "linked_in/organization"
require "linked_in/posts"
require "linked_in/profile"
require "linked_in/social_metadata"
require "linked_in/vector_assets"
require "linked_in/videos"

# The primary API object that makes requests.
# It composes in all of the endpoints
require "linked_in/api"

module LinkedIn
  @config = Configuration.new

  class << self
    attr_accessor :config
  end

  def self.configure
    yield self.config
  end
end
