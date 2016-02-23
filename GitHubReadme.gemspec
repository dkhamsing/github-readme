# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'github-readme/version'

Gem::Specification.new do |spec|
  spec.name          = GitHubReadme::PRODUCT
  spec.version       = GitHubReadme::VERSION
  spec.authors       = ["dkhamsing"]
  spec.email         = ["dkhamsing8@gmail.com"]

  spec.summary       = 'Get the README from a GitHub repository'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/dkhamsing/github-readme'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = [GitHubReadme::PRODUCT]
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'octokit', '~> 4.2.0' # github
end
