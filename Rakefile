require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "cache-with-yuicompressor"
    gem.summary = %Q{"Automatically compress javascript and CSS bundles using YUI Compressor"}
    gem.description = %Q{"This gem sets up javascript and CSS bundle file compression using the YUI Compressor. For example, using [javascript_include_tag \"prototype\", \"cart\", \"checkout\", :cache => \"shop\"] creates a combined javascript file named shop.js. With this gem, YUI compressor will also be run on shop.js, resulting in a smaller, obfuscated file."}
    gem.email = "kelkar.amol@gmail.com"
    gem.homepage = "http://github.com/amolk/cache-with-yuicompressor"
    gem.authors = ["Amol Kelkar"]
    gem.add_development_dependency "thoughtbot-shoulda", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "cache-with-yuicompressor #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
