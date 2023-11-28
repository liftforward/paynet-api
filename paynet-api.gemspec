# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paynet_api/version'

Gem::Specification.new do |spec|
  spec.name          = "paynet-api"
  spec.version       = PaynetApi::VERSION
  spec.authors       = ["Drew Nichols"]
  spec.email         = ["drew@liftforward.com"]

  spec.summary       = "Client Gem for the Paynet Api"
  spec.description   = "Client Gem for the Paynet Api"
  spec.homepage      = "https://github.com/liftforward/paynet-api"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency 'builder',     '~> 3.2'
  spec.add_dependency 'hashie',      '~> 3.4'
  spec.add_dependency 'faraday',     '~> 0.14'
  spec.add_dependency 'nori',        '~> 2.6'
  spec.add_dependency 'activemodel', '> 4.2'
end
