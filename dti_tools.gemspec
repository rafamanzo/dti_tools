# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dti_tools/version'

Gem::Specification.new do |spec|
  spec.name          = "dti_tools"
  spec.version       = DTITools::VERSION
  spec.authors       = ["Rafael Reggiani Manzo"]
  spec.email         = ["rr.manzo@gmail.com"]
  spec.description   = "Diffusion Tensor Image tools for my MSc"
  spec.summary       = "DTI tools"
  spec.license       = "LGPLv3"

  spec.files         = `git ls-files`.split($/)
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "facter", "~> 1.7.5"
  spec.add_dependency "nifti", "~> 0.0.2"
  spec.add_dependency "narray", "~> 0.6.0.8"
  spec.add_dependency "thor", "~> 0.18.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  # Tests
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "mocha", "~> 1.0.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "factory_girl", "~> 4.4"
end
