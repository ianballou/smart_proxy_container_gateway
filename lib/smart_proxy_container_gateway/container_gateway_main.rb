module Proxy::ContainerGateway
  extend ::Proxy::Util
  extend ::Proxy::Log

  class << self

    def say_hello
      Proxy::ContainerGateway::Plugin.settings.hello_greeting
    end

  end
end
