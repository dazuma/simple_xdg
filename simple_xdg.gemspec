# frozen_string_literal: true

lib = ::File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "simple_xdg/version"

::Gem::Specification.new do |spec|
  spec.name = "simple_xdg"
  spec.version = ::SimpleXDG::VERSION
  spec.authors = ["Daniel Azuma"]
  spec.email = ["dazuma@gmail.com"]

  spec.summary = "A simple implementation of the XDG Base Directory Specification."
  spec.description =
    "This class provides a simple no-frills implementation of the XDG Base" \
    " Directory Specification, which defines where certain user-specific" \
    " application files, such as configuration, cache, and saved state," \
    " should live on the user's file system. It specifies environment" \
    " variables that contain this information, and defaults that should be" \
    " used if those environment variables are unset. The spec itself is at" \
    " https://specifications.freedesktop.org/basedir/latest/"
  spec.license = "MIT"
  spec.homepage = "https://github.com/dazuma/simple_xdg"

  spec.files = ::Dir.glob("lib/**/*.rb") +
               (::Dir.glob("*.md") - ["CLAUDE.md", "AGENTS.md"]) +
               [".yardopts"]
  spec.require_paths = ["lib"]

  spec.add_dependency "logger"
  spec.required_ruby_version = ">= 2.7"

  spec.metadata["bug_tracker_uri"] = "https://github.com/dazuma/simple_xdg/issues"
  spec.metadata["changelog_uri"] = "https://rubydoc.info/gems/simple_xdg/#{::SimpleXDG::VERSION}/file/CHANGELOG.md"
  spec.metadata["documentation_uri"] = "https://rubydoc.info/gems/simple_xdg/#{::SimpleXDG::VERSION}"
  spec.metadata["homepage_uri"] = "https://github.com/dazuma/simple_xdg"
end
