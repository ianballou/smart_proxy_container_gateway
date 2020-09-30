require 'sinatra'
require 'smart_proxy_container_gateway/container_gateway'
require 'smart_proxy_container_gateway/container_gateway_main'

module Proxy::ContainerGateway

  class Api < ::Sinatra::Base
    include ::Proxy::Log
    helpers ::Proxy::Helpers

    get '/hello' do
      Proxy::ContainerGateway.say_hello
    end

    # endpoints that podman will hit

    get '/v2/:repository/manifests/:tag' do
      redirection_location = Proxy::ContainerGateway.get_manifests(params[:repository], params[:tag])
      redirect to(redirection_location)
    end
  end
end
