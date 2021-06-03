MRuby::Gem::Specification.new("mruby-core_structures") do |spec|
  load "#{__dir__}/mruby/load.rb"
  spec.license = "MIT"
  spec.authors = "Daniel Inkpen"
  spec.rbfiles = files("core_structures")
end
