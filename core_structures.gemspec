Gem::Specification.new do |spec|
  root = File.expand_path('..', __FILE__)
  require File.join(root, "lib", "core_structures", "version.rb").to_s

  spec.name = "core_structures"
  spec.version = CoreStructures::VERSION
  spec.authors = ["Daniel Inkpen"]
  spec.email = ["dan2552@gmail.com"]

  spec.summary = "An odd collection of core structures/classes that aren't in the stdlib."
  spec.description = "Primarily for the Pelican UI framework, but not dependent on it. Can be used as both a Ruby gem and mruby mrbgem."
  spec.homepage = "https://github.com/Dan2552/core_structures"
  spec.license = "MIT"

  spec.files = Dir
    .glob(File.join(root, "**", "*.rb"))
    .reject { |f| f.match(%r{^(test|spec|features)/}) }

  if File.directory?(File.join(root, "exe"))
    spec.bindir = "exe"
    spec.executables = Dir.glob(File.join(root, "exe", "*")).map { |f| File.basename(f) }
  end

  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec"
end
