# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'cucumber/adriver/version'

Gem::Specification.new do |s|
  s.name = "cucumber-adriver"
  s.platform = Gem::Platform::RUBY
  s.version = Cucumber::Adriver::VERSION
  s.summary = "Testing plugin for Adriver with Cucumber."
  s.description = "Helps you write cucumber tests."

  s.authors = ["G.Rusakov"]
  s.email = ["takebsd@gmail.com"]

  s.require_paths = ["lib"]
  s.files = `git ls-files`.split(/\r?\n\r?/)
  s.extra_rdoc_files = s.files.grep(/^[A-Z]+(\.md)*$/)

  s.add_runtime_dependency "cucumber", "~> 1.1.2"
  s.add_runtime_dependency "cucumber-nagios", ">= 0.9.2"
  s.add_runtime_dependency "sys-proctable"
  s.add_development_dependency "rake", ">= 0.8.3"
end

