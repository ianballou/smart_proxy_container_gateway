require 'net/http'
require 'uri'

module Proxy::ContainerGateway
  extend ::Proxy::Util
  extend ::Proxy::Log

  class << self

    def say_hello
      Proxy::ContainerGateway::Plugin.settings.hello_greeting
    end

    # Methods for forwarding requests from podman to Pulp 3

    def get_manifests(repository, tag)
      uri = URI.parse(Proxy::ContainerGateway::Plugin.settings.pulp_endpoint + '/pulpcore_registry/v2/' +
                      repository + '/manifests/' + tag)
      uri.to_s
      # TODO: Setup cert, key, headers, etc
    end
  end
end
