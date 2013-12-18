# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-smartcloud/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tim Guibord"]
  gem.email         = ["timguibord@gmail.com"]
  gem.description   = %q{Official OmniAuth strategy for Smartcloud.}
  gem.summary       = %q{Official OmniAuth strategy for Smartcloud.}
  gem.homepage      = "https://github.com/tagCincy/omniauth-smartcloud"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-smartcloud"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Smartcloud::VERSION

  gem.add_dependency 'omniauth'
  gem.add_dependency 'omniauth-oauth2'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
