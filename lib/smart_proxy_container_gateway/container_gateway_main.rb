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

      cert = OpenSSL::X509::Certificate.new(File.open(Proxy::ContainerGateway::Plugin.settings.pulp_client_ssl_cert, 'r').read)
      key =  OpenSSL::PKey::RSA.new(File.open(Proxy::ContainerGateway::Plugin.settings.pulp_client_ssl_key, 'r').read)

      http_client = Net::HTTP.new(uri.host, uri.port)
      http_client.cert = cert
      http_client.key = key
      http_client.use_ssl = true

      response = http_client.start do |http|
        request = Net::HTTP::Get.new uri
        http.request request
      end

      response['location']
    end
  end
end
