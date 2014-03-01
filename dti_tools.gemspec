# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dti_tools/version'

Gem::Specification.new do |spec|
  spec.name          = "dti_tools"
  spec.version       = DTITools::VERSION
  spec.authors       = ["Rafael Reggiain Manzo"]
  spec.email         = ["rr.manzo@gmail.com"]
  spec.description   = "Diffusion Tensor Image tools for my MSc"
  spec.summary       = "DTI tools"
  spec.license       = "LGPLv3"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
