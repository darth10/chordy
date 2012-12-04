# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake/dsl_definition'
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "chordy"
  gem.rubyforge_project = "chordy"
  gem.version = "0.7.1"
  gem.homepage = "http://github.com/darth10/chordy"
  gem.license = "MIT"
  gem.summary = %Q{DSL for guitar chords}
  gem.description = %Q{Chordy is a DSL written in Ruby to print guitar chords diagrams}
  gem.email = "akhil.wali.10@gmail.com"
  gem.authors = ["Akhil Wali"]
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => [:test, :build]

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "chordy #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('LICENSE.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
