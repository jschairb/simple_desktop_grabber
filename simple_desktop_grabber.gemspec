# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "simple_desktop_grabber/version"

Gem::Specification.new do |s|
  s.name        = "simple_desktop_grabber"
  s.version     = SimpleDesktopGrabber::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Joshua Schairbaum"]
  s.email       = ["joshua.schairbaum@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Sync backgrounds from simpledesktop.com}
  s.description = %q{Sync backgrounds from simpledesktop.com to a local folder}

  s.rubyforge_project = "simple_desktop_grabber"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('nokogiri')
  s.add_development_dependency('rspec')
end
