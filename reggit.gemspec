# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reggit/version'

Gem::Specification.new do |spec|
  spec.name          = "reggit"
  spec.version       = Reggit::VERSION
  spec.authors       = ["Christopher Erin"]
  spec.email         = ["chris.erin@gmail.com"]
  spec.description   = %q{Wrap git for more pleasant output on specific tasks.}
  spec.summary       = %q{Wrap git for more pleasant output on specific tasks.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency('rdoc')
  spec.add_development_dependency('aruba')
  spec.add_development_dependency('rake', '~> 0.9.2')
  spec.add_dependency('methadone', '~> 1.2.5')
  spec.add_dependency('rainbow')
end
