$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "scrutanize/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "scrutanize"
  s.version     = Scrutanize::VERSION
  s.authors     = ["Zach Colon, Jonathan York"]
  s.email       = ["zcolon80@gmail.com"]
  s.homepage    = "https://github.com/wzcolon/scrutanize.git"
  s.summary     = ""
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency 'bootstrap-sass', '~> 3.3.6'
  s.add_dependency 'sass-rails', '>= 3.2'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'haml'

  s.add_development_dependency "sqlite3"
  # s.add_development_dependency "pry-byebug"
  # s.add_development_dependency "rspec-rails"
  # s.add_development_dependency "shoulda-matchers"
  # s.add_development_dependency "factory_girl_rails"
  # s.add_development_dependency "capybara"
  # s.add_development_dependency "selenium-webdriver"
  # s.add_development_dependency "poltergeist"
  # s.add_development_dependency "database_cleaner"
end
