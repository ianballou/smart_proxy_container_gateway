require File.expand_path('../lib/smart_proxy_container_gateway/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'smart_proxy_container_gateway'
  s.version = Proxy::ContainerGateway::VERSION

  s.summary = 'Container gateway smart proxy plugin'
  s.description = 'Container gateway smart proxy plugin'
  s.authors = ['Ian Ballou']
  s.email = 'ianballou67@gmail.com'
  s.extra_rdoc_files = ['README.md', 'LICENSE']
  s.files = Dir['{lib,settings.d,bundler.d}/**/*'] + s.extra_rdoc_files
  s.homepage = 'http://github.com/ianballou/smart_proxy_container_gateway'
  s.license = 'GPLv3'
end
