lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "niz/version"

Gem::Specification.new do |spec|
  spec.name          = "niz"
  spec.version       = Niz::VERSION
  spec.authors       = ["KURASAWA Nozomu"]
  spec.email         = ["nabetaro@caldron.jp"]

  spec.summary       = %q{Access to keyboard from NiZ (https://www.nizkeyboard.com/)}
  spec.description   = %q{Access to keyboard from NiZ (https://www.nizkeyboard.com/)}
  spec.homepage      = "https://github.com/nabetaro/niz-ruby"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "http://www.caldron.jp"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/nabetaro/niz-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/nabetaro/niz-ruby/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "hidapi", "0.1.9"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry-nav"
end
