# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cache-with-yuicompressor}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Amol Kelkar"]
  s.date = %q{2010-06-02}
  s.description = %q{"This gem sets up javascript and CSS bundle file compression using the YUI Compressor. For example, using [javascript_include_tag "prototype", "cart", "checkout", :cache => "shop"] creates a combined javascript file named shop.js. With this gem, YUI compressor will also be run on shop.js, resulting in a smaller, obfuscated file."}
  s.email = %q{kelkar.amol@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/cache-with-yuicompressor.rb",
     "lib/jargs-1.0.jar",
     "lib/rhino-1.6R7.jar",
     "lib/yuicompressor-2.4.2.jar",
     "test/helper.rb",
     "test/test_cache-with-yuicompressor.rb"
  ]
  s.homepage = %q{http://github.com/amolk/cache-with-yuicompressor}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Automatically compress javascript and CSS bundles using YUI Compressor}
  s.test_files = [
    "test/helper.rb",
     "test/test_cache-with-yuicompressor.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  end
end

